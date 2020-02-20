<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="jquery/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
	tr:HOVER {
	background-color: #9d9f9e;
}
</style>
</head>
<body>
	<form action="list" method="post">
	发布时间：<input type="date" name="d1" value="${a.d1}">--
	<input type="date" name="d2" value="${a.d2}">
	
	<select name="choice">
		<option value="">--请选择--</option>
		<c:if test="${choice=='created'}">
		<option value="created" selected>发布时间</option>
		</c:if>
		<c:if test="${choice!='created'}">
		<option value="created">发布时间</option>
		</c:if>
		<c:if test="${choice=='user_id'}">
		<option value="user_id" selected>作者</option>
		</c:if>
		<c:if test="${choice!='user_id'}">
		<option value="user_id">作者</option>
		</c:if>
		<c:if test="${choice=='commentCnt'}">
		<option value="commentCnt" selected>评论数量</option>
		</c:if>
		<c:if test="${choice!='commentCnt'}">
		<option value="commentCnt">评论数量</option>
		</c:if>
	</select>
	<input type="submit" value="查询">
		<table>
			<tr>
				<td>ID</td>
				<td>标题</td>
				<td>发布时间</td>
				<td>作者</td>
				<td>评论数量</td>
			</tr>
			<c:forEach items="${list}" var="a">
			<tr>
				<td>${a.id}</td>
				<td>${a.title}</td>
				<td><ftm:formatDate value="${a.created}"/></td>
				<td>${a.username}</td>
				<td>${a.commentCnt}</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="10">
					<button name="pageNum" value="1">首页</button>
					<button name="pageNum" value="${page.prePage==0?1:page.prePage}">上一页</button>
					<button name="pageNum" value="${page.nextPage==0?page.pages:page.nextPage}">下一页</button>
					<button name="pageNum" value="${page.pages}">尾页</button>
					当前页/总页数：${page.pageNum}/${page.pages}
				</td>
			</tr>
		</table>
	</form>
</body>
</html>