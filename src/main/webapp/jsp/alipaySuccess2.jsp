<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<script src="<%=request.getContextPath() %>/static/js/jquery.min.js" type="text/javascript"></script>

<html>

    <head>
        
    </head>
    
    <body>
        <h1 style="color: green;">购买成功</h1>
        <table>
        	<tr>
        		<td>
        			订单编号: ${out_trade_no }
        		</td>
        	</tr>
        		<td>
        			支付宝交易号: ${trade_no }
        		</td>
        	<tr>
        	</tr>
        		<td>
        			实付金额: ${total_amount }
        		</td>
        	<tr>
        	</tr>
        		<td>
        			购买产品：会员缴费
        		</td>
        	</tr>
	        <tr>
		        <td> 十五秒后自动关闭页面</td>

	        </tr>
        </table>

<%--    <script>--%>
<%--	    $(function() {--%>
<%--		    setTimeout(function() {--%>
<%--			    // 做一些事情;--%>
<%--		    }, 500);--%>
<%--	    });--%>
<%--    </script>--%>


        <div id="showTimes"></div>
        <script type="text/javascript">
	        function webpageClose(){
		        window.close();
	        }
	        setTimeout( webpageClose,15000)//10s钟后关闭
        </script>


    </body>
    
</html>


