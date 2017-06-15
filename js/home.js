$(document).ready(function(){

    var winHeight = $(window).height();
    var winWidth = $(window).width();   
    /*设置栅格图片尺寸*/
    var holderWidth = $("div.holder").width();
    $("div.holder").height(holderWidth);
    $(window).resize(function(){
        var holderWidth = $("div.holder").width();
        $("div.holder").height(holderWidth);
    });


    /*显示隐藏菜单*/
    $("span.menubtn").hover(function () {
        $(this).find('i').eq(0).animate({'bottom':'2px'}, 100);
        $(this).find('i').eq(2).animate({'top':'2px'}, 100);
    }, function () {
        $(this).find('i').eq(0).animate({'bottom':'0px'}, 100);
        $(this).find('i').eq(2).animate({'top':'0px'}, 100);
    });
    $("span.menubtn").click(function(){
        var num = 0;
        var winHeight = $(window).height();
        var winWidth = $(window).width();
        var listHeight = winHeight*0.14;
        if(winWidth > 992){
            var listWidth = winWidth*0.25;
        } else {
            var listWidth = winWidth;
        }
        $("div.menu_hide")
        .animate({width: listWidth+"px"}, 300)
        .animate({height: "100%"}, 300, function () {
            showList();
        });
        $('div.menu_hide .menu-mask').fadeIn();
        $("body").css({"width":$('body').width(),"overflow":"hidden"});
        function showList(_this){
            $("img.closemenu,div.menu_hide .name").fadeIn();
            setTimeout(function () {
                $("ul.nav li a").eq(0).animate({opacity: 1, left: "0px"});
                $("ul.nav li a").eq(1).delay(100).animate({opacity: 1, left: "0px"});
                $("ul.nav li a").eq(2).delay(200).animate({opacity: 1, left: "0px"});
                $("ul.nav li a").eq(3).delay(300).animate({opacity: 1, left: "0px"});
                $("ul.nav li a").eq(4).delay(400).animate({opacity: 1, left: "0px"});   
                setTimeout(function () {
                    $("ul.nav li a").addClass('transition');
                }, 1000);
            }, 200);
        }
    });
    
    $("img.closemenu,div.menu_hide .menu-mask").click(function(){
        $("ul.nav li a").removeClass('transition').css({opacity: 0, left: "7%"});
        $("img.closemenu,div.menu_hide .name,div.menu_hide .add-info,div.menu_hide .menu-mask").fadeOut();
        $("div.menu_hide")
        .animate({height: "5px"})
        .animate({width: 0},function () {
            $("body").css({"width":"auto","overflow":"auto"});
        });
    });

});

function pullcode(_this) {
    var codeurl = $('.cart-box .client-info .codeurl').attr('href');
    var phone = $(_this).siblings('input[name=phone]').val();
    if (!test_phone(phone)) {
        $(_this).siblings('input[name=phone]').focus();
        return false;
    };
    var code = '';
    for (var i = 0; i < 6; i++) {
        code += Math.floor(Math.random()*10);
    };
    setCookie('code', code);
    miaotime(_this, 60);
    $.post(codeurl, {code: code, phone: phone});
}


function phonecheck(_this) {
    var val = $(_this).val();
    if (test_phone(val)) {
        $(_this).siblings('button').css('color','#FD5C00');
    } else {
        $(_this).siblings('button').css('color','#999');
    };
}
