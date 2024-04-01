<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

	<div id="memberHeader" style="height: 150px;">
		<div class="container">
			<header
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
				<a :href="`${host}/index`"
					class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
					<img src="/images/company_icon.png" style="width: 200px; height: 120px;">
				</a>

				<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
					<li><a :href="`${host}/index`" class="nav-link px-2 link-secondary">回首頁</a></li>


					<li v-if="logged == null"><a :href="`${host}/login`" class="nav-link px-2 link-dark">會員中心</a>
					</li>


					<li v-if="logged != null"><a :href="`${host}/memberCenter`" class="nav-link px-2 link-dark">會員中心</a>
					</li>
					<li><a href="" class="nav-link px-2 link-dark">說明文件</a>
					</li>

				</ul>

				<div class="col-md-3 text-end" v-if="logged == null">
					<button type="button" class="btn btn-outline-primary me-2" @click="tologin">登入</button>
					<button type="button" class="btn btn-primary" @click="toRegister">註冊</button>
				</div>

				<div class="col-md-3 text-end" v-if="logged != null">
					使用者：<strong style="font-size: 17px">{{logged.userAcc}}&nbsp;&nbsp;</strong>
					<button type="button" class="btn btn-primary" @click="logout">登出</button>
				</div>


			</header>
		</div>


		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="https://www.unpkg.com/axios@1.6.7/dist/axios.min.js"></script>
		<script type="module">
			import { createApp } from "https://www.unpkg.com/vue@3.4.19/dist/vue.esm-browser.prod.js"
			import { host } from '/js/url.js';
			var jsonDataString = sessionStorage.getItem("loginStatus");
			var jsonData = JSON.parse(jsonDataString);
			const app = createApp({
				data: function () {
					return {
						logged: jsonData,
						host: host
					}
				}, created() {
					if (sessionStorage.getItem("Validation") !== null) {
						sessionStorage.removeItem("Validation");
					}
				}
				, methods: {
					logout: function () {
						sessionStorage.clear();
						window.location.href = host + "/logoutSuccess"
					},
					tologin: function () {
						window.location.href = host + "/login"
					},
					toRegister: function () {
						window.location.href = host + "/register"
					},
					toGroupTourData: function () {
						sessionStorage.setItem("catalog", "5");
						window.location.href = host + "/html/grouptour/ShowUserGroupTour.html"
					},
				}

			})
			app.mount("#memberHeader");
		</script>
	</div>