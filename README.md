# Capstone (개인 프로젝트)
## 메인페이지
<img src="https://user-images.githubusercontent.com/50486476/77847397-bb369a00-71f7-11ea-870f-980cf196d821.png" width="80%" />

## 개요
- 온라인에서 저렴하게 책을 구입하고자 하는 사용자들이나 책이 품절 또는 절판되어 더 이상 구하기 힘든 사용자들의 불편함을 해소할 수 있는 사이트
- 사용자가 검색하여 정보를 요청할 때마다 주요 대형서점 사이트의 데이터를 수집해와 이를 통합하여 보여줌
- 자체 중고 장터 게시판을 구축하여 판매/교환/검색이 가능하도록 구현

## 기간 및 일정 
2019.09 ~ 2019.12 

## 개발 언어 및 환경
- Spring Framework, MySQL, Mybatis, Tomcat8.0, Java, JSP, Html, CSS, JavaScript, Jstl, JSON 
- Naver 검색 api, aladin api, 도서관 정보나루 api

## 사이트 구성요소
- 자체사이트 게시판 
- 가격비교 검색결과
- 도서관 소장여부 검색

## 구현내용
1. Spring MVC구조를 기반으로 한 Web Application
2. 자체 사이트 게시판 CRUD 및 검색과 페이징, Ajax이용한 파일첨부 구현
3. Aladin api, Naver api 이용하여 도서 정보 크롤링하여 정보 수집
4. Api에 없는 정보는 Jsoup library 사용하여 크롤링 
5. 수집된 데이터들을 Parsing 하여 제공
6. 도서관 정보나루 csv 파일이용하여 도서관 목록 DB에 추가 
7. 도서관 정보나루 api, ISBN코드를 통해  도서관 소장여부 검색기능

## 세부내용
### [가격비교 검색결과]
<img src="https://user-images.githubusercontent.com/50486476/77847726-4022b300-71fa-11ea-9174-fae0ed3b6fa6.png" width="50%" />

- 국내 도서 사이트인 알라딘과 yes24의 정보를 통합하여 출력
- Crawling과 aladin api를 이용하여 정보수집
- 최저가, 재고, 사진등의 정보출력

### [도서관 소장여부 결과]
<img src="https://user-images.githubusercontent.com/50486476/77848321-df49a980-71fe-11ea-84e6-73ff583cb6b4.png" width="50%" />

- 도서관 정보나루 api를 이용하여 원하는 지역의 도서관에 소장여부 파악가능
- 도서관 정보나루에서 제공하는 도서관 900곳의 정보를 DB에 저장 후 sql문을 이용해 검색결과 출력 

### [게시판 목록]
<img src="https://user-images.githubusercontent.com/50486476/77848331-ea9cd500-71fe-11ea-8843-a4260fa82906.png" width="60%" />

- 글쓰기/수정/삭제/댓글/검색 구현
- Ajax 이용한 파일첨부 구현

### [글작성시 자동완성]
<img src="(https://user-images.githubusercontent.com/50486476/77848379-38194200-71ff-11ea-9d72-49c19f23ffff.png" width="60%" />

- Naver 검색Api로 책이름을 검색하면 검색정보를 넘겨주도록 구현
- 사용자는 나머지 정보만 채우면 되므로 편리함.

## 보완점
- 
