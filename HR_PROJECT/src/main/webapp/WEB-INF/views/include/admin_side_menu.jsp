<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.InetAddress" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<div id="layoutSidenav_nav">
   <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
      <div class="sb-sidenav-menu">
         
         <div class="nav">     
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false"   aria-controls="collapseNotice"> 공지사항
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${root}notice/all/noticeAll?board_info_idx=1">전체 공지사항</a>
                  <a class="nav-link" href="${root}notice/sub/noticeSub">부서 공지사항</a>
               </nav>
            </div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMove" aria-expanded="false"   aria-controls="collapseNotice"> 인사발령
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseMove" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${root}transfer/move">인사발령</a>
                  <a class="nav-link" href="${root}transfer/record">인사발령기록</a>
               </nav>
            </div>
            <a class="nav-link" href="${root}member/admin_chart"> 구성원 </a>
            <a class="nav-link" href="${root}admin/admin_join"> 계정신청 </a>
         </div>
      </div>
   </nav>
</div>

