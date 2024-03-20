1. 클론

2. 프로젝트 우클릭 -> properties

3. Dynamic Web Module 체크 옆에 4.0으로 바꾸기

4. Java 체크하고 17로 바꾸기

5. JavaScript 체크

6. 오른쪽에 runtime 텝 누르고 apache tomcat 9 . 어쩌고 체크

7. apply and close

8. lib폴더에 jar파일 넣어야하는거 4개 넣기







//////to do////////

1. 미비한 예외처리 개선
2. postService, boardService 간 중복된 코드 제거
3. css를 파일 하나로 취합하여 관리
4. 메인 공지사항/hot게시판 출력시 리스트 사이즈가 0이라면 "아직 등록된 게시글이 없습니다"를 출력
5. 불필요한 주석 제거
6. 접근하면 안되는 url에 접근 막기 (board/list, header, 임시저장된게시글들의po_num을 통한 접근, 기타 ajax용 서블릿url)
7. 테스트용 코드 제거(sysout)
