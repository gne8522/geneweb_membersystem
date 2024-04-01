<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <div id="adminSideBar" style="width: 300px; height: 100vh">
        <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 300px; height: 100vh">
            <div href="" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap" />
                </svg>
                <span class="fs-4">後臺資訊系統</span>
            </div>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item"><a href="#" class="nav-link active" aria-current="page" @click="tobackend"
                        v-if="catalog == '1'">
                        <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#home" />
                        </svg> 首頁
                    </a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white" aria-current="page" @click="tobackend"
                        v-if="catalog != '1'">
                        <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#home" />
                        </svg> 首頁
                    </a></li>

                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item"><a href="#" class="nav-link active" aria-current="page"
                            @click="toCustomerService" v-if="catalog == '2'">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#home" />
                            </svg> 客服中心
                        </a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white" aria-current="page"
                            @click="toCustomerService" v-if="catalog != '2'">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#home" />
                            </svg> 客服中心
                        </a></li>

                    <li class="nav-item"><a href="#" class="nav-link active" v-if="catalog == '3'"
                            @click="tomemberQuery">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#speedometer2" />
                            </svg> 會員資料中心
                        </a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white" v-if="catalog != '3'"
                            @click="tomemberQuery"> <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#speedometer2" />
                            </svg> 會員資料中心
                        </a></li>

                    <li class="nav-item"><a href="#" class="nav-link active" aria-current="page"
                            @click="toPlatformCenter" v-if="catalog == '4'">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#home" />
                            </svg> 平台管理系統
                        </a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white" aria-current="page"
                            @click="toPlatformCenter" v-if="catalog != '4'">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#home" />
                            </svg> 平台管理系統
                        </a></li>

                

                    <li><a href="#" class="nav-link text-white"> <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#people-circle" />
                            </svg>

                        </a></li>
                </ul>
                <hr>
                <div >
                    <p class="d-flex align-items-center text-white "
                        id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                        <strong>{{logged.adminName}}</strong>
                    </p>
                  
                </div>
                <br>
                <button @click="logout" class="btn btn-warning">登出</button>

                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script src="https://www.unpkg.com/axios@1.6.7/dist/axios.min.js"></script>
                <script type="module">
                    import { createApp } from "https://www.unpkg.com/vue@3.4.19/dist/vue.esm-browser.prod.js"
                    import { host } from '/js/url.js';
                    var jsonDataString = sessionStorage.getItem("adminData");
                    var catalog = sessionStorage.getItem("catalog");
                    console.log(catalog)
                    var jsonData = JSON.parse(jsonDataString);
                    const app = createApp({
                        data: function () {
                            return {
                                logged: jsonData,
                                host: host,
                                catalog: catalog
                            }
                        }, methods: {
                            logout: function () {
                                sessionStorage.clear();
                                window.location.href = host + "/logoutSuccess"

                            },
                            tobackend: function () {
                                sessionStorage.setItem("catalog", "1");
                                window.location.href = host + "/backend"
                            },
                            tomemberQuery: function () {
                                sessionStorage.setItem("catalog", "3");
                                window.location.href = host + "/memberQuery"
                            },
                            toRentCarSystem: function () {
                                sessionStorage.setItem("catalog", "7");
                                window.location.href = host + "/html/rentcar/findAll.html"
                            },
                            toGroupTourSystem: function () {
                                sessionStorage.setItem("catalog", "6");
                                window.location.href = host + "/html/grouptour/ShowGroupTour.html"
                            },
                            toHotelSystem: function () {
                                sessionStorage.setItem("catalog", "8");
                                window.location.href = host + "/findAllHotels"
                            },
                            toCustomerService: function () {
                                sessionStorage.setItem("catalog", "2");
                                window.location.href = host + "/adminCustomerService"
                            },
                            toPlatformCenter: function () {
                                sessionStorage.setItem("catalog", "4");
                                window.location.href = host + "/adminPlatformCenter"
                            },
                            toForumSystem: function () {
                                sessionStorage.setItem("catalog", "5");
                            },

                        }

                    })
                    app.mount("#adminSideBar");
                </script>
        </div>
    </div>