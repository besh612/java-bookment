## 2020년 2학기 지능웹설계 프로젝트

---

ISBN기반으로 도서를 검색하고 평가, 감상문을 남길 수 있는 web기반 독서기록장 북먼트(Bookment)

## Prerequisite

---

- Java (jdk 1.8)
- Maria DB (10.4.12)
- Network Connection
- Kakao Search API key ([https://developers.kakao.com/product/search](https://developers.kakao.com/product/search))

## Pre-run work

---

- DB 설정
    1. 데이터베이스 생성

        ```sql
        create database bookment;
        ```

    2. Account 테이블 생성

        ```sql
        CREATE TABLE `account` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `username` varchar(40) NOT NULL DEFAULT '',
          `email` varchar(255) NOT NULL DEFAULT '',
          `password` varchar(255) NOT NULL DEFAULT '',
          `regdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
          PRIMARY KEY (`id`)
        ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
        ```

    3. Books 테이블 생성

        ```sql
        CREATE TABLE `books` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `bookname` varchar(255) NOT NULL DEFAULT '',
          `isbn` varchar(255) NOT NULL DEFAULT '',
          `content` text NOT NULL,
          `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
          `rating` int(11) DEFAULT 0,
          `thumbnail` varchar(255) DEFAULT NULL,
          `creator` int(11) DEFAULT NULL,
          `author` varchar(100) DEFAULT '',
          PRIMARY KEY (`id`)
        ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
        ```

- DB 계정 연동 & Kakao API Key 설정

    파일 위치 : **src/bookment/utils/DButils.java**

    ```java
    11: String dbId = "DB 계정 아이디";
    12: String dbPass = "DB 계정 비밀번호";
    ```

    파일 위치 : web**/main.jsp**

    ```jsx
    154: headers: {'Authorization': '발급받은 Kakao API key'},
    ```

- 프로젝트에 라이브러리 추가
    1. Gson (2.8.6) - [https://search.maven.org/artifact/com.google.code.gson/gson/2.8.6/jar](https://search.maven.org/artifact/com.google.code.gson/gson/2.8.6/jar)
    2. jstl (1.2) - [https://mvnrepository.com/artifact/javax.servlet/jstl/1.2](https://mvnrepository.com/artifact/javax.servlet/jstl/1.2)
    3. MariaDB Connector/J (2.7.1) - [https://downloads.mariadb.org/connector-java/2.7.1/](https://downloads.mariadb.org/connector-java/2.7.1/)

## Run

---

<div>
<img src="screenshot/1.png?raw=true" width="60%">
<img src="screenshot/2.png?raw=true" width="60%">
<img src="screenshot/3.png?raw=true" width="60%">
</div>
