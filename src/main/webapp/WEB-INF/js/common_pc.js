$(function(){

    //回顶部
    var win = window,
        $win = $(win),
        window_height = $win.height(),
        $fixed_side = $('.fixed-side');
    
   
    $win.on('scroll',function scroll () {
        if ( $win.scrollTop() >40 ){
            $fixed_side.fadeIn();
        } else {
            $fixed_side.fadeOut();
        }
    });
    
    $('#to_top').on('click',function to_top (){

        $('html,body').animate({
            scrollTop:0
        },500);
    });
    
    //显示二维码
    var $qr_code = $('.qr-code');
    $('.login-info').on('mouseover','.show_qr',function(){
        $qr_code.stop().slideDown();

        if ( !this.right_dist ) {
            this.right_dist = '0';
        }

        if ( $(this).hasClass('username') ){
            this.right_dist = 65;
        } else {
            this.right_dist = 0;
        }

        $qr_code.css({
            right : this.right_dist + 'px'
        });

    }).on('mouseout',function(){
        $qr_code.stop().slideUp();
    });

    var $qr_code2 = $('.qr-code2');
    $('.nav-about').on('mouseover','.show_qr a',function(){
        $qr_code2.stop().slideDown();
    }).on('mouseout',function(){
        $qr_code2.stop().slideUp();
    });


    //商品分类
    var $menu = $(".dropdown-menu");

    $menu.menuAim({
        activate: activateSubmenu,
        deactivate: deactivateSubmenu,
        enter : function(){
        },
        exit: function() {
            $(".popover").css("display", "none");
            //$("a.maintainHover").removeClass("maintainHover");
            //$("li .maintainHover").removeClass("maintainHover");
            $('.dropdown-box').removeClass('open');
        }
    });

    function activateSubmenu(row) {
        var $row = $(row),
            submenuId = $row.data("submenuId"),
            $submenu = $("#" + submenuId),
            height = $menu.outerHeight(),
            width = $menu.find('.hd').outerWidth();

        // Show the submenu
        $submenu.css({
            display: "block"
        });

        $row.find(".hd").addClass("maintainHover");
        $row.find('.popover').css({
            "min-height" : height/*,
            "height" : $row.find('.popover').children(".link-list").height()*/
        });
    }

    function deactivateSubmenu(row) {
        var $row = $(row),
            submenuId = $row.data("submenuId"),
            $submenu = $("#" + submenuId);

        $submenu.css("display", "none");
        $row.find(".hd").removeClass("maintainHover");
    }

    $(".dropdown-menu li").click(function(e) {
        e.stopPropagation();
    });

    $('.dropdown-box').mouseover(function(e){
        e.stopPropagation();
        $(this).addClass('open');

    });

    $('.dropdown-toggle').mouseout(function(e){
        e.stopPropagation();
        $('.dropdown-box').removeClass('open');
        //$(".dropdown-menu li .hd").removeClass("maintainHover");
    });
});

function popTips(str,fn,t){
    var time = t || 2000;
    var popt = $("<div class='popt'>"+str+"</div>");
    $(".popt").remove();
    $("body").append(popt);
    popt.css({
        "margin-left":-popt.innerWidth()/2+"px",
        "left":"50%",
        "top":$(window).scrollTop()+($(window).height()-popt.innerHeight())/2 + "px"
    });
    popt.delay(time).fadeOut(500,function(){
        popt.remove();
        if(fn){
            fn();
        }
    });
}
