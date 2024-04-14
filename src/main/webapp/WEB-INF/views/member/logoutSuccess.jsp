<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="1; url=/index">
    <title>登出</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/signin.css">
        <script>
            if (window.self !== window.top) {
                window.top.location.href = window.self.location.href;
            }
        </script>
    
    </head>
    <body class="text-center" id="app">
        <main class="form-signin">
            
            <h1 class="h3 mb-3 fw-normal"></h1>
            <div style="padding-bottom: 30px;">
                
            </div>
    
            <div class="form-floating">
                <label for="floatingInput"></label>
            </div>
    
            <div class="form-floating">
                <h2>登出成功!!</h2>
                <img alt="" src="/images/loading_dot.gif" style="width: 50px">
                <h3>即將轉回首頁...</h3>
                <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Password"
                    v-model="userPwd" hidden> <label for="floatingPassword"></label>
            </div>
    
            <div class="checkbox mb-3">
                <label> <input type="checkbox" value="remember-me" hidden>
                  
                </label>
            </div>
    
            <div class="checkbox mb-3"></div>
            <button class="w-100 btn btn-lg btn-primary" type="button" @click="login" hidden></button>
    
            <p class="mt-5 mb-3 text-muted"></p>
    
    
        </main>
    
    
    
    
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://www.unpkg.com/axios@1.6.7/dist/axios.min.js"></script>
        <script src="/js/url.js"></script>
        <script type="module">
            import { createApp } from "https://www.unpkg.com/vue@3.4.19/dist/vue.esm-browser.prod.js";
            const app = createApp({
                data: function () {
                    return {
                        userAcc: '',
                        userPwd: '',
                        userData: null,
                        newhost: newhost,
                        
                    }
                }, methods: { 
                }
            })
            app.mount("#app");
    
        </script>
    
    </body>
    </html>