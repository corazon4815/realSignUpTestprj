(function(W, D) {
    W.$loginView = W.$loginView || {};


    $(document).ready(function () {
        $loginView.event.enter_login();
    });

    /*$loginView.ui = {*/
        /*doLogin : function() {
            if (this.validate()) {
                //ajax 호출
            }
        },

        validate : function() {
            var member_id = $('#member_id').val();
            var member_pw = $('#member_pw').val();
            if (member_id == "") {
                alert("ID를 입력하세요.");
                return false;
            } else if (member_pw == "") {
                alert("비밀번호를 입력하세요.");
                return false;
            }
            return true;
        }*/
    /*};*/

    $loginView.event = {
        /**
         * @name enter_login
         * @description 엔터키로 로그인 할 수 있게 함.
         */
            enter_login : function() {
               $(".btn_login").keydown(function(key) {

                   if (key.keyCode == 13) {

                       $loginView.event.btn_login();

                   }

               });
           },

        /**
         * @name setEventUI
         * @description 로그인 버튼 클릭 이벤트
         */
          /*  $('#btn_login').click(function () {*/
            btn_login : function() {

                let memberId = $('#memberId').val();
                let memberPw = $('#memberPw').val();
                if (memberId == "") {
                    $commonFunc.message.alert("알림","ID를 입력하세요.")
                    return false;
                } else if (memberPw == "") {
                    $commonFunc.message.alert("알림","비밀번호를 입력하세요.")
                    return false;
                } else {
                    $.ajax({
                        type: "post",
                        url: "/member/login",
                        data: "memberId=" + memberId + "&memberPw=" + memberPw,
                        dataType: "json",
                        success: function (data) {/*, textStatus, xhr*/
                            if (data.result) {
                                window.location.href = '/view/mainview';
                            }else{
                            $commonFunc.message.alert("알림","아이디와 비밀번호를 확인해주세요.")
                            }
                        }
                        ,
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "error:" + error);
                        }
                    });
                }
            }

    };


}(window, document));
