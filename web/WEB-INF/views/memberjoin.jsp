
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>회원가입</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script>
        /*var member_id = $('#member_id').val();*/
        $(function() {
            $("#btn_duplChk").click(function() {
                var member_id = $('#member_id').val();
                $.ajax({
                    url : '${pageContext.request.contextPath}/member/checkid/?member_id='+ member_id,
                    type : 'get',
                    success : function(data) {

                        if (data >= 1) {
                            // 1 : 아이디가 중복되는 문구
                            $("#id_check").text("사용중인 아이디입니다");
                            $("#id_check").css("color", "red");
                            $("#reg_submit").attr("disabled", true);
                        }  else {

                            if(member_id == ""){

                                $('#id_check').text('아이디를 입력해주세요');
                                $('#id_check').css('color', 'red');
                                $("#reg_submit").attr("disabled", true);

                            } else {
                                $('#id_check').text('사용 가능한 아이디 입니다.');
                                $("#reg_submit").attr("disabled", false);
                            }

                        }
                    }, error : function() {
                        console.log("실패");
                    }
                });
            });
        });

        $(function() {
            $("#reg_submit").click(function() {
                var member_pw = $('#member_pw').val();
                var member_pw_chk = $('#member_pw_chk').val();
                var form = {
                    member_id: $('#member_id').val(),
                    member_name: $('#member_name').val(),
                    member_address: $('#member_address').val(),
                    member_pw: $('#member_pw').val(),
                    member_birth: $('#member_birth').val()
                };
                if (member_pw!=member_pw_chk){
                    $('#pw_check').text('비밀번호가 일치하지 않습니다.');
                    $('#id_check').css('color', 'red');
                    return false;
                }else {
                    $.ajax({
                        url: "/member/register",
                        type: "POST",
                        data: JSON.stringify(form),
                        contentType: "application/json; charset=utf-8;",
                        dataType: "json",
                        success: function (data) {
                            if (data == 0) {
                                window.close();
                            } else {
                                alert('에러.')
                            }
                        },
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "error:" + error);

                        }
                    });
                }})
        });

    </script>
</head>
<body>
<form id="joinForm" method="post">
    <div class="form-group">
        <label for="member_id">아이디</label><br>
        <input type="text"  id="member_id" name="member_id" required><input type="BUTTON" name="btn_duplChk" id="btn_duplChk" value="중복확인" ><br>
        <div class="check_font" id="id_check"></div><br>

        <label for="member_name">이름</label><br>
        <input type="text" id="member_name" name="member_name" required><br>

        <label for="member_address">주소</label><br>
        <input type="text" id="member_address" name="member_address" required><br>

        <label for="member_pw">비밀번호</label><br>
        <input type="text" id="member_pw" name="member_pw" required><br>
        <label for="member_pw_chk">비밀번호 확인</label><br>
        <input type="text" id="member_pw_chk" name="member_pw_chk" required><br>
        <div class="check_font" id="pw_check"></div><br>

        <label for="member_birth">생년월일</label><br>
        <input type="date" id="member_birth" name="member_birth" required><br>
    </div>
    <input type="submit" name="reg_submit" id="reg_submit" value="등   록" >
    <input type='BUTTON' value="닫기" onClick='self.close()'>



</form>
</body>
</html>