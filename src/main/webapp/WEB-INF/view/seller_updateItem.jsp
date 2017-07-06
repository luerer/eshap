<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%--
  Created by IntelliJ IDEA.
  User: luerer
  Date: 06/07/2017
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改商品</title>
</head>
<body>
<script>
    function addType() {
        var add_type = document.getElementById("add_type").value;
        if(!window.confirm("确认添加商品种类："+add_type)){
            return;
        }
        var newType={
            "newType":add_type
        };
        $.ajax({
            async: false,
            url: '/seller/addType',
            type: 'POST',
            data: newType,
            scriptCharset: 'utf-8',
            success: function (message) {
                alert(message);
                location.reload(true);
            }
        });

    }

    function updateItem(item_id) {
        if(!window.confirm("确认修改商品？")){
            return;
        }
        var item_name = document.getElementById("name_"+item_id).value;
        var item_price = document.getElementById("price_"+item_id).value;
        var item_stock = document.getElementById("stock_"+item_id).value;
        var item_info = document.getElementById("info_"+item_id).value;
        var item_type = document.getElementById("type_"+item_id).value;

        var item={
            "item_name":item_name,
            "item_price":item_price,
            "item_stock":item_stock,
            "item_info":item_info,
            "item_type":item_type,
            "item_id":item_id,
        };
        $.ajax({
            async: false,
            url: '/seller/updateConfirm',
            type: 'POST',
            data: item,
            scriptCharset: 'utf-8',
            success: function (message) {
                alert(message);
                location.reload(true);
            }
        });


    }
</script>
修改商品|<a href="/seller">返回</a>
<hr/>

<table id="detail-panel" border="1">
    <tr>
        <td>商品名称：</td>
        <td>
            <input style="text-align: center;" id ="name_${item.item_id}"  name="item_name" value="${item.item_name}" />
        </td>
    </tr>
    <tr>
        <td>商品展示：</td>
        <td>
            <img src="/img/${item.item_pic}.jpg" onerror="this.src='/img/blank.jpg'">
        </td>
    </tr>
    <tr>
        <td>商品类别：</td>
        <td><span>
            <select id="type_${item.item_id}" name="item_type">
                <c:forEach var="type" items="${typeList}">
                    <option value="${type.type_name}" <c:if test="${item.item_type==type.type_name}">selected="selected"</c:if>>${type.type_name}</option>
                </c:forEach>
            </select>
            或者添加：
            <input id="add_type"/>
            <input type="submit" onclick="addType()" value="提交"/>
        </span></td>
    </tr>
    <tr>
        <td>商品描述：</td>
        <td>
            <input style="text-align: center;" id ="info_${item.item_id}"  name="item_info" value="${item.item_info}" />
        </td>
    </tr>
    <tr>
        <td>商品价格：</td>
        <td>
            <input style="text-align: center;" id="price_${item.item_id}" name="item_price" value=${item.item_price} />
        </td>
    </tr>
    <tr>
        <td>商品库存：</td>
        <td>
            <input style="text-align: center;" id ="stock_${item.item_id}"  name="item_stock" value=${item.item_stock} />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" onclick="updateItem(${item.item_id})" value="修改商品" />
        </td>
    </tr>

</table>


</body>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>
