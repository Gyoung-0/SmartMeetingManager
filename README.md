# SmartMeetingManager

Smart Meeting Manager 실행 가이드

1. 프로젝트 소개

Smart Meeting Manager는 회의 관리, 참가자 관리, 실시간 채팅을 제공하는 웹 애플리케이션입니다. 이 가이드는 프로젝트를 실행하는 방법을 단계별로 설명합니다.

2. 실행 환경

필수 조건:

	1.Java Development Kit (JDK):
		•		버전: 8 이상
		•	설치 및 환경 변수 설정.
	2.Apache Tomcat:
		•	버전: 9.0 이상
		•	Tomcat 설치 후 실행 가능하도록 설정.
	3.MySQL Database:
		•	버전: 5.7 이상
		•	데이터베이스를 생성하고 초기 데이터를 설정합니다.
	4.IDE (선택 사항):
		•	Eclipse, IntelliJ IDEA 등 JSP/Servlet 지원 IDE.
	5.웹 브라우저:
		•	Chrome, Edge, Firefox 등 최신 브라우저 권장.

3. 설치 및 실행

3.1. 코드 다운로드

	1.	프로젝트를 로컬 디렉터리에 다운로드합니다.
 ```bash
git clone https://github.com/username/smart-meeting-manager.git
cd smart-meeting-manager
```

3.2. 데이터베이스 설정

	1.	MySQL에서 새로운 데이터베이스를 생성합니다.
 ```bash
CREATE DATABASE smart_meeting_manager;
```

	2.	제공된 schema.sql 파일을 실행하여 테이블을 생성합니다.

 ```bash
mysql -u [username] -p smart_meeting_manager < schema.sql
```


3.3. 데이터베이스 연결 구성

	1.	src/com/smartmeetingmanager/util/DBUtil.java 파일을 열고 데이터베이스 설정을 수정합니다:
 ```bash
private static final String URL = "jdbc:mysql://localhost:3306/smart_meeting_manager";
private static final String USER = "your_mysql_username";
private static final String PASSWORD = "your_mysql_password";
```

3.4. Tomcat 서버 설정

	1.	프로젝트를 IDE로 열고, Tomcat 서버를 추가합니다.
	2.	프로젝트를 Tomcat 서버에 배포합니다:
	•	Eclipse: Servers 뷰에서 프로젝트를 서버에 추가.
	•	IntelliJ IDEA: Run/Debug Configurations에서 Tomcat 설정.

3.5. 서버 실행

	1.	Tomcat 서버를 실행합니다.
	2.	웹 애플리케이션이 정상적으로 배포되었는지 확인합니다:
 ```
http://localhost:8080/smart-meeting-manager
```


