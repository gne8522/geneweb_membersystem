<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>首頁</title>
    
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    
    <script>
        if (window.self !== window.top) {
            window.top.location.href = window.self.location.href;
        }
        window.addEventListener('load', function() {
            document.body.style.display = 'block';
        });
    </script>
    
    
    <style>
    #fullHeightDiv {
        height: 100vh;
        background-image: url('/images/index_pic.webp');
        background-size: cover;
        background-position: center;
        text-align: center;
        padding: 20px;
        color: white;
    }
    body {
            display: none;
        }
    </style>
    
    
    </head>
    <body>
    <div></div>
        <header>
            <jsp:include page="/components/header.jsp" />
        </header>
    
        <main>
            <div id="fullHeightDiv"></div>
        </main>
    
        <footer>
            <jsp:include page="/components/footer.jsp" />
        </footer>
    
    
    </body>
    </html>