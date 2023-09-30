<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
 <tiles:insertAttribute name="link" />

  <link href="/css/user/css.css" rel="stylesheet" >
</head>
 
<body>
    
     <tiles:insertAttribute name="header" />
      <tiles:insertAttribute name="body" />
     <tiles:insertAttribute name="footer" />
</body>
</html>