<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의 생성</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 400px; margin: 0 auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; background: #f9f9f9; }
        label { display: block; margin: 10px 0 5px; }
        input, textarea { width: 100%; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { padding: 10px 15px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #218838; }
        .back-link { display: block; margin-top: 20px; text-align: center; }
    </style>
    <script>
        window.onload = function() {
            const now = new Date();
            const localISOTime = new Date(now.getTime() - now.getTimezoneOffset() * 60000)
                .toISOString()
                .slice(0, 16); // "YYYY-MM-DDTHH:mm" 형식
            document.getElementById('startTime').value = localISOTime;
        };
    </script>
</head>
<body>
    <h1 style="text-align: center;">회의 생성</h1>
    <form action="MeetingController" method="post">
        <input type="hidden" name="action" value="create">

        <label for="title">회의 제목:</label>
        <input type="text" id="title" name="title" placeholder="회의 제목을 입력하세요" required>

        <label for="description">회의 설명:</label>
        <textarea id="description" name="description" placeholder="회의 설명을 입력하세요" rows="4"></textarea>

        <label for="startTime">시작 시간:</label>
        <input type="datetime-local" id="startTime" name="startTime" required>

        <button type="submit">회의 생성</button>
    </form>

    <div class="back-link">
        <a href="MeetingController?action=list">← 회의 목록으로 돌아가기</a>
    </div>
</body>
</html>