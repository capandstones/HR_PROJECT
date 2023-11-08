<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                     <div class="sb-sidenav-footer" style="left-padding:30px">
                   <img src="${root }image/img1.svg" style="float:left;width:40px; margin-right: 10px;"/>
                        <div class="small">접속자명</div>
                        박정민  바지사장
                    </div>
                        <div class="nav">
                        	<button style="margin-top: 10px; height: 40px; border-radius: 20px;">출근하기</button>
                            <div class="sb-sidenav-menu-heading">알림</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMessenger" aria-expanded="false" aria-controls="collapseMessenger">
                              
                                메신저
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMessenger" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971" >
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Messenger-received.html">받은 메신저</a>
                                    <a class="nav-link" href="Messenger-send.html">보낸 메신저</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="news.html">
                               
                                새로운 소식
                            </a>
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false" aria-controls="collapseNotice">
                               
                                공지사항
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="notice-all.html">전체 공지사항</a>
                                    <a class="nav-link" href="notice-department.html">부서 공지사항</a>
                                    <a class="nav-link" href="notice-favorites.html">즐겨찾기</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMember" aria-expanded="false" aria-controls="collapseMember">
                               
                                구성원
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMember" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="member.html">구성원</a>
                                    <a class="nav-link" href="organization-chart.html">조직도</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="calendar.html">
                                
                                캘린더
                            </a>
                            <a class="nav-link" href="commute.html">
                               
                                출퇴근
                            </a>
                            <a class="nav-link" href="workflow.html">
                               
                                워크플로우
                            </a>
                            <a class="nav-link" href="vacation.html">
                               
                                휴가
                            </a>
                            <a class="nav-link" href="salary.html">
                                
                                급여
                            </a>
                        </div>
                    </div>
                </nav>
            </div>