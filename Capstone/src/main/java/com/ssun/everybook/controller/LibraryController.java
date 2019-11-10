package com.ssun.everybook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssun.everybook.domain.LibraryInput;
import com.ssun.everybook.service.LibraryService;

@Controller
@RequestMapping("/bookbook/*")
public class LibraryController {

	private static final Logger logger = LoggerFactory.getLogger(LibraryController.class);

	@Inject
	private LibraryService service;

	// input 받아서 db에 넘겨주고 db 결과 값 가져와야됨.
	// 객체로 넘기기
	@RequestMapping(value = "/library", method = RequestMethod.GET)
	public String getLibraryInput(LibraryInput libInput, Model model, HttpServletRequest request,
			@RequestParam(value = "isbn", required = false, defaultValue = "") String isbn,
			@RequestParam(value = "code", required = false, defaultValue = "") String code) throws Exception {

		logger.info("@@@@@@@@@@@@@@@ISBN::::::::" + isbn);
		logger.info("도서관코드:::::::" + code);
		logger.info("###############3#####libINput######################\n\n" + libInput);

		if (null != libInput && !(libInput.equals(null))) {
			System.out.println("지역이랑 지역이 null이 아님");

			model.addAttribute("regions", service.listLibrary(libInput));
			// 도서 소장 여부 api실행 //도서관 코드가 NULL이 아닐 때
//code != null || !(code.equals(null)) || code.isEmpty() ||
			if ( !("".equals(code)) || !(code.equals(""))) {
				System.out.println("code가 /' /'공백 이 아닐 떄 " + code);
				//확인
				String naru = service.libraryApi(code, isbn); // 도서가 있으면
				if (naru.equals("Y")) {
					System.out.println("Controllerrrrrrrrrrrrrrrrrrrrrrrr + 소장하고있어요");
					model.addAttribute("checking", "도서가 없습니다."); // 도서가 없으면
					model.addAttribute("reCode",code);
					//System.out.println("rerererererererererererereCode"+code);
				} else if (naru.equals("N")) {
					System.out.println("Controllerrrrrrrrrrrrrrrrrrrrrrrr - 없어요그런거");
					model.addAttribute("checking", "도서가 있습니다.");
					model.addAttribute("reCode",code);
					//System.out.println("rerererererererererererereCode"+code);
				}
			} else {
				System.out.println("도서관 코드가 null일 떄" + code);
			}
		} else {
			System.out.println("지역ㅇ랑 지역이 null여기서 아무것도 하면 안돼");

		}

		/*
		 * if (code !=null && code.isEmpty() && (!code.equals(null))) { String real =
		 * service.libraryApi(code, isbn); if (real.equals("N")) {
		 * System.out.println("Controllerrrrrrrrrrrrrrrrrrrrrrrr - 없어요그런거"); } else if
		 * (real.equals("Y")) {
		 * System.out.println("Controllerrrrrrrrrrrrrrrrrrrrrrrr + 소장하고있어요"); } }
		 */
		/*
		 * if (!code.equals(null)) { System.out.println(service.libraryApi(code, isbn) +
		 * "결과"); }
		 */

		return "library";
	}

	/*
	 * // input 받아서 db에 넘겨주고 db 결과 값 가져와야됨. // 값으로 넘기기
	 * 
	 * @RequestMapping(value = "/library", method = RequestMethod.GET) public String
	 * getInput(HttpServletRequest request,
	 * 
	 * @RequestParam(value = "region", required = false, defaultValue = "") String
	 * region,
	 * 
	 * @RequestParam(value = "region2", required = false, defaultValue = "") String
	 * region2) throws Exception {
	 * 
	 * logger.
	 * info("@@@@@@@@@@@@@@@@@@@@@@@@@@@Library Controller@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	 * ); // 주소 System.out.println(region); // 상세주소 System.out.println(region2);
	 * 
	 * //service.listAll(); return "library"; }
	 */

}
