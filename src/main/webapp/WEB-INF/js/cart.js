/*购物车相关JS*/

$(".icon-del").on("click",function(){
    $(".icon-del").siblings(".popup-delete-goods").hide();
    $(this).siblings(".popup-delete-goods").show();
    $(this).parents(".goods-row").css({"position":"relative","z-index":2}).siblings(".goods-row").css("z-index",1);
});

$(".btn-cancle").on("click",function(){
    $(this).parents(".popup-delete-goods").hide();
});

//删除商品
$(".btn-del").on("click",function(){
    if(!$(this).parents(".goods-row").siblings(".goods-row").length){
        $(this).parents(".goods-item-list").remove();
    }else{
        $(this).parents(".goods-row").remove();
    }

    var flag = true;
    $(".goods-item-list").each(function(){
        var flag2 = true;
        $(this).children(".goods-row").find("input[type=checkbox]").each(function(){
            if(!$(this).prop("checked")){
                flag = flag2 = false;
                $("#select_all_1,#select_all_2").prop("checked",false);
                $(this).parents(".goods-row").siblings(".row").children("input[type=checkbox]").prop("checked",false);
                return false;
            }
        });
        if(flag2){
            $(this).children(".row").children("input[type=checkbox]").prop("checked",true);
        }
    });
    
    if(flag){
        $("#select_all_1,#select_all_2").prop("checked",true);
    }

    //do ajax here
});

$("#select_all_1,#select_all_2").on("click",function(){     //全选
    if($(this).prop("checked")){
        $(".wrap input[type=checkbox]").prop("checked",true);
    }else{
        $(".wrap input[type=checkbox]").prop("checked",false);
    }
});
$(".goods-item-list input[type=checkbox]").on("click",function(){
    var flag = null;
    if($(this).parent(".row").length){   //二级
        if($(this).prop("checked")){
            flag = true;
            $(this).parent(".row").siblings(".row").find("input[type=checkbox]").prop("checked",true);
            $(this).parents(".goods-item-list").siblings(".goods-item-list").find(".row>input[type=checkbox]").each(function(){
                if(!$(this).prop("checked")){
                    flag = false;
                    return false;
                }
            });
            if(flag){
                $("#select_all_1,#select_all_2").prop("checked",true);
            }
        }else{
            $(this).parent(".row").siblings(".row").find("input[type=checkbox]").prop("checked",false);
            $("#select_all_1,#select_all_2").prop("checked",false);
        }
    }else{
        if($(this).prop("checked")){
            flag = true;
            $(this).parents(".goods-row").siblings(".goods-row").find("input[type=checkbox]").each(function(){
                if(!$(this).prop("checked")){
                    flag = false;
                    return false;
                }
            });
            if(flag){
                $(this).parents(".goods-row").siblings(".row").eq(0).find("input[type=checkbox]").prop("checked",true);
            }
        }else{
            $(this).parents(".goods-row").siblings(".row").eq(0).find("input[type=checkbox]").prop("checked",false);
            $("#select_all_1,#select_all_2").prop("checked",false);
        }
    }
});


/*提交订单JS*/
//订单
/*$(".coupon-box").on("click",".rdbox",function(){
    if($(this).hasClass("rdboxon")){
        return false;
    }
    if($(this).hasClass("rdbox-not")){
        popTips("此优惠券不能使用哦！");
        return false;
    }
    $(this).parents(".has-coupon").find(".rdboxon").removeClass("rdboxon").siblings(".radio-choose").prop("checked",false);
    $(this).addClass("rdboxon").siblings(".radio-choose").prop("checked",true);
});*/


//优惠券展开收起
$(".coupon-box").on("click",".cli-tap",function(){
    if($(this).children("i").hasClass("show")){
        $(this).children("i").removeClass("show");
        $(this).children("span").text("展开全部");
        $(".coupon-list li").eq(3).nextAll("li").hide();
    }else{
        $(this).children("i").addClass("show");
        $(this).children("span").text("收起优惠劵");
        $(".coupon-list li").show();
    }
});

$(".titdot").on("click",function(){
    if($(this).parent().parent().hasClass("content-hide")){
        $(this).parent().parent().removeClass("content-hide");
    }else{
        $(this).parent().parent().addClass("content-hide");
    }
});
var iCouponTimer = null;
$(".coupon-intro").on({
    "mouseover":function(){
        clearTimeout(iCouponTimer);
        $(this).parents("li").css("z-index",2).siblings("li").css("z-index",1);
        $(this).parents("li").siblings("li").find(".coupon-intro-box").height(0).hide();
        $(this).children(".coupon-intro-box").show().stop().animate({"height":$(this).children(".coupon-intro-box").children(".coupon-intro-box-bd").outerHeight()+"px"},300);
    },
    "mouseout":function(){
        var obj = $(this).children(".coupon-intro-box");
        iCouponTimer = setTimeout(function(){
            obj.show().stop().animate({"height":0},300,function(){
                obj.hide();
            }); 
        },20);
    }
});

//选择地址
$(".address-box").on("mouseover",".address-list li",function(){
    if($(this).hasClass("selected")){
        return false;
    }
    $(this).find(".hdbox a").show();
    $(this).find(".change-btn").show();
}).on("mouseout",".address-list li",function(){
    if($(this).hasClass("selected")){
        return false;
    }
    $(this).find(".hdbox a").hide();
    $(this).find(".change-btn").hide();
});
$(".address-box").on("click",".address-list li",function(event){
    var cur = $(this).addClass("selected").siblings("li");
    $(this).addClass("selected").siblings("li").removeClass("selected")
    cur.removeClass("selected");
    cur.find(".hdbox a").hide();
    cur.find(".change-btn").hide();
});

//地址修改
$(".address-box").on("click",".change-btn",function(){
    return false;
});

//默认地址
$(".address-box").on("click",".address-list-bd .hdbox a",function(){
    if($(this).hasClass(".default")){
        return false;
    }

    //do ajax here
    var id = $(this).parent().parent().attr('address');
    var url = 'checkout.php?act=set_default_address&addressId='+id;
    var choose = $(this);
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        success: function(data){
            if (data.code === 0) {
                $(".address-list-bd .hdbox .default").removeClass("default").text("设为默认地址");
                choose.addClass("default").text("默认地址");
            }
        }
    });

    return false;
});

//完善报关信息
$(".address-box").on("mouseover",".notice span",function(){
    $(this).siblings(".coupon-intro-box").show().height("auto");
});

$(".address-box").on("mouseout",".notice span",function(){
    $(this).siblings(".coupon-intro-box").hide();
});

//身份证弹窗提示
$(".about-tips-intro").on({
    "mouseover":function(){
        clearTimeout(iCouponTimer);
        $(this).children(".coupon-intro-box").show().stop().animate({"height":$(this).children(".coupon-intro-box").children(".coupon-intro-box-bd").outerHeight()+"px"},300);
    },
    "mouseout":function(){
        var obj = $(this).children(".coupon-intro-box");
        iCouponTimer = setTimeout(function(){
            obj.show().stop().animate({"height":0},300,function(){
                obj.hide();
            });
        },20);
    }
});

//保存地址-设为默认地址
$(".receiver-info-save label").on("click",function(){
    if($(this).hasClass("on")){
        $(this).removeClass("on");
    }else{
        $(this).addClass("on");
    }
});

//支付方式
$(".pay-style").on("click","h4 span",function(){
    if($(this).children("label").hasClass("on")){
        return false;
    }
    $(this).children("label").addClass("on");
    var firstLi = $(this).parent().siblings(".banklist").children(".first");
    firstLi.children("label").addClass("on");
    $(this).parents(".pay-style").siblings(".pay-style").find("label").removeClass("on");
    $("#payStyle").val(firstLi.data("paystyle"));
});

$(".pay-style").on("click","li",function(){
    if($(this).hasClass("last")){
        if($(this).hasClass("on")){
            $(this).removeClass("on");
            $(this).children("span").html("显示更多");
            $(this).siblings("li[class!=first]").hide();
        }else{
            $(this).addClass("on");
            $(this).children("span").html("收起更多");
            $(this).siblings("li[class!=first]").show();
        }
        return false;
    }
    if($(this).children("label").hasClass("on")){
        return false;
    }
    $(this).children("label").addClass("on");
    $(this).parent(".banklist").siblings("h4").find("label").addClass("on");
    $(this).siblings("li").children("label").removeClass("on");
    $(this).parents(".pay-style").siblings(".pay-style").find("label").removeClass("on");
    $("#payStyle").val($(this).data("paystyle"));
});

//关闭支付提示弹窗
function closePopTips(callback){
    $(".pop-tips").hide();
    $(".bg").hide();
    if(callback){
        callback();
    }
}