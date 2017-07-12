<%@ taglib prefix="h" uri="http://www.springframework.org/tags/form" %>
<%--
  Just shows the Game menu
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> -->
    <style>

        .header {
            widht: 200px;
            height: 60px;
            line-height: 30px;
            text-align: center;
            color: #ff9900;
            border: 1px dotted black;
        }

        .navigation {
            widht: 200px;
            height: 40px;
            line-height: 30px;
            text-align: left;
            text-indent: 20px;
            color: white;
            background-color: #4b4b4b;
            border: black 1px dotted;
        }

        .sidebar {
            alignment: center;
            widht: 200px;
            height: 300px;
            border: 1px;
            float: left;
        }

        .content {
            widht: 200px;
            height: 300px;
            border: 1px dotted black;
            margin-left: 200px;
        }

        .footer {
            widht: 200px;
            height: 130px;
            border: 1px dotted black;
        }
    </style>
</head>
<!-- Makes request-string for storyController and returns  -->
<script type="text/javascript">
    var service = "/story";
    //get all stories
    var GetAllStories = function () {
        $.ajax({
            type: 'GET',
            url: service + "/all",
            dataType: 'json',
            async: false,
            success: function (result) {
                clear();
                result.forEach(function (item) {
                    buildResult(item);
                    document.getElementById('response').innerHTML += buildResult(item);
                });
            },
            error: function (jgXHR, textStatus, errorThrown) {
                $('#response').html(JSON.stringify(igXHR))
            }
        });
        //cleans body 'response' before filling
        function clear() {
            document.getElementById('response').innerHTML = ' ';
        }

        //builds 'buildString' var and places it to 'response' div
        function buildResult(item) {
            var buildString = "<a href='Javascript:' OnClick= 'Javascript: GetStoryById(" + item.id + ");return false;'>$('item.name').val();</a><br>"
            return buildString;
        }
    };

    // gets story by id
    var GetStoryById = function (id) {
        $.ajax({
            type: 'GET',
            url: service + "/get/story/" + id,
            dataType: 'json',
            async: false,
            success: function (result) {
                //$('#content').html(JSON.stringify(result));
                //var t =  result.description;
                document.getElementById('content').innerHTML="<h2>" + result.description +"</h2>";
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#content').html(JSON.stringify(jqXHR))
            }
        });
    };
    //put story name and description
    var PutStoryName = function (client_name,descr_name) {
        var JSONObject = {
            'name': client_name,
            'description': descr_name
        };
        $.ajax({
            type: 'PUT',
            url: service + "/add",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(JSONObject),
            dataType: 'json',
            async: false,
            success: function (result) {
                $('#content').html(JSON.stringify(result));
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };
</script>

<body>
<div class="header"><h1>AERA</h1></div>
<div class="navigation"><A style="color: white" HREF="javascript:void(0);"
                           OnClick="Javascript:GetAllStories();return false;">STORIES</a>
    Get Story by id <input type="text" id="putName" value=""/>
    <button type="button" onclick="GetStoryById($('#putName').val())">Try</button>
    Put Story name: <input type="text" id="ptName" value=""/>
    Description: <input type="text" id="ptDescr" value=""/>
    <button type="button" onclick="PutStoryName($('#ptName').val(),$('#ptDescr').val())">
        Try</button>
</div>
<div class="sidebar" id="response">
</div>
<div class="content" id="content"></div>
<div class="footer"></div>
<table>
    <tr>
    <td>Add document</td>
    <td><code><strong>POST</strong>/docment/add</code></td>
    <td>
        <h:form class="form-inline">
        name: <input type="text" id="postName"  value="documentname"></input>
        <br>
        code: <input type="text" id="postCode" value="code"></input>
        <br>
        date: <input type="text" id="postDate" value="date"></input>
        <br>
        documentItem: <input type="text" id="postDocumentItem" value="documentItem"></input>
        <button type="button" onclick="RestPost()">Try</button>
        </h:form>
    </td>
    </tr>
</table>
</body>
</html>