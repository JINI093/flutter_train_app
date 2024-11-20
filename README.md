# Flutter_기차 예매 프로그램

## 📖 목차
1. [프로젝트 소개]
2. [주요기능](#주요기능)
3. [개발기간](#개발기간)
4. [프로젝트 파일 구조](#프로젝트-파일-구조)
5. [Trouble Shooting](#trouble-shooting)
    
## 👨‍🏫 프로젝트 소개
내일배움캠프 Flutter_5기 주특기 주차 개인 프로젝트로 기차 예매 프로그램 입니다.
명세서를 바탕으로 프로그램을 제작하였습니다..
<img alt="명세서 이미지" src="[https://private-user-images.githubusercontent.com/181442256/384272923-b46b9d69-2b9a-4f43-a90e-4200e323829d.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzEwNTIzMzQsIm5iZiI6MTczMTA1MjAzNCwicGF0aCI6Ii8xODE0NDIyNTYvMzg0MjcyOTIzLWI0NmI5ZDY5LTJiOWEtNGY0My1hOTBlLTQyMDBlMzIzODI5ZC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMTA4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTEwOFQwNzQ3MTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0yYjU0MDE0MzFjNzEzODA3NzVjNDRjMThiMDUxM2Y2MmRmOTMxNmZhY2YxMWJjOWU1OGZhMzY1NWY3MjUxOTBmJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.egcV0oFS_rrrlUhgUZxOhkOt9KWxkJIW7LQCLlUu9xE](https://private-user-images.githubusercontent.com/181442256/387912847-9119766e-f7cb-4d79-aac8-ff68b6a2e50a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzIwNzI1ODQsIm5iZiI6MTczMjA3MjI4NCwicGF0aCI6Ii8xODE0NDIyNTYvMzg3OTEyODQ3LTkxMTk3NjZlLWY3Y2ItNGQ3OS1hYWM4LWZmNjhiNmEyZTUwYS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMTIwJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTEyMFQwMzExMjRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00NTYyYmNhMTE5MDM0OWRhN2U5M2NkZTY2NzgwZmFmNGM4Nzc0ZGRjYzIwNTFkMjIxZmI4OThjNDM1NjdiNGI2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.Y6hwn5aHASLy8qRSEGjMzAw_SSASYmb6CmnRZHjOmrw)"/>

## 프로젝트 개요
기본 조건 (Basis)
----------------
- 프로젝트 명은 `flutter_train_app` 입니다.
- 출발역, 도착역을 선택할 수 있는 초기 화면의 이름은 `HomePage` 로 합니다.
- 기차역 리스트를 보여주고 선택할 수 있는 화면의 이름은 `StationListPage` 로 합니다.
- 좌석을 선택하는 화면의 이름은 `SeatPage` 로 합니다.
- 선택할 수 있는 기차역은 `"수서","동탄","평택지제","천안아산","오송","대전","김천구미","동대구","경주","울산","부산"` 총 11개의 역으로 합니다.

앱 UI Flow
- 홈 페이지에서 출발역, 도착역을 선택
- 기차역 리스트 페이지 : 홈페이지에서 출발역, 도착역을 클릭했을 때 11개의 기차역 노출
- 기차역을 선택하면 홈 페이지에서 출발역, 도착역에 기차역 표시
- 좌석 선택을 누르면 좌석 선택 페이지로 이동
- 좌석 선택 페이지에서는 좌석을 스크롤로 이동 가능
- 좌석을 선택하면 보라색으로 변경
- 예매 하기 버튼을 누르면 팝업 출력
- 취소를 누르면 다시 좌석 선택 창으로 이동
- 확인을 누르면 메인화면으로 복귀

## 💜 주요기능

- HomePage에서 출발역 선택시 기차역 선택 가능
- 선택한 역이 없는 초기 상태에는 '선택'문구 출력
- 출발역, 도착역이 선택되어 있지 않으면 좌석 선택 불가능
- 출발역과 도착역에 같은 역명 표시 불가
- 좌석 선택시 보라색으로 변경
- 선택된 좌석이 없을시 예매 하기 버튼 비활성화
    


## ⏲️ 개발기간
- 2024.11.13(수) ~ 2024.11.20(수)

### ✔️ Language
- dart


## 프로젝트 파일 구조

## Trouble Shooting
- [ https://jin0629.tistory.com/manage/newpost/14?type=post&returnURL=https%3A%2F%2Fjin0629.tistory.com%2Fmanage%2Fposts](https://jin0629.tistory.com/23)
