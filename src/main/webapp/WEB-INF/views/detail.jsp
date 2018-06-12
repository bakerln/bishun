<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINAN
  Date: 2018-05-29
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <title>汉语辞书笔画</title>
        <script src="${resourceServer}/assets/js/jquery-1.8.3.min.js?v=${versionNo}"></script>
        <link rel="stylesheet" type="text/css" href="${resourceServer}/assets/css/bootstrap.css?v=${versionNo}"/>
        <link rel="stylesheet" type="text/css" href="${resourceServer}/assets/css/style.css?v=${versionNo}"/>
        <script type="text/javascript">
            function next() {
                document.form.submit();
            }
            function prev() {
                window.location.href="index.htm";
            }
            function play(){
                var video = document.getElementById("video");
                video.play();
            }
        </script>
    </head>
    <body class="detail">
    <div class="title tct">
        3500字笔顺动画
    </div>
    <div class="home" ><img src="${resourceServer}/assets/img/home.png" onclick="prev()"></div>
    <div class="searchwrap tct">
        <form method="post" action="/bishun/detail.htm" name="form">
            <input name="hanzi" type="text" class="form-control lt" placeholder="请输入汉字" onkeyup="enter()">
            <button type="button" class="btn" onclick="next()">
                <img src="${resourceServer}/assets/img/2.png">
            </button>
        </form>
    </div>
    <div class="detailwrap tct">
        <table class="mytable infoRow">
            <tr><td class="trt">注音：</td><td class="tlt">${hanzi.get("pinyin")}</td><td class="trt">笔画数：</td><td class="tlt">${hanzi.get("bihua_num")}画</td></tr>
            <tr><td class="trt">部首：</td><td class="tlt">${hanzi.get("bushou")}</td><td class="trt">结构：</td><td class="tlt">${hanzi.get("jiegou")}</td></tr>
        </table>
        <video src="${nginxServer}/video/${hanzi.get("video_url")}" width="400" controls="controls" id="video" autoplay="autoplay" loop	="loop">
            您的浏览器版本过低啦，请升级一下哦
        </video>
        <div class="trumpet" ><img src="${resourceServer}/assets/img/trumpet.png" onclick="play()"></div>
    </div>
    <div id="capture" class="capture tct">
        <table class="dtltable infoRow">
            <tr>
                <c:forEach var="item" items="${bihua}">
                    <td>
                     <div class="no">${item.getNo()}</div><img src="${nginxServer}/image/${item.getUrl()}">
                    </td>
                </c:forEach>
            </tr>
            <tr class="tct name">
                <c:forEach var="item" items="${bihua}">
                    <td>${item.getBihua()}</td>
                </c:forEach>
            </tr>
        </table>
    </div>
    <div class="footer tct" style="margin-bottom:15px;">
        copyrights @FLTRP
    </div>
    </body>
</html>
