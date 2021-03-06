<!DOCTYPE html>
<!--[if lte IE 9]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 9]><!-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<html class="no-js">
<!--<![endif]-->

<!-- Mirrored from xvelopers.com/html/planet/Classic/cart1.html by HTTrack Website Copier/3.x [XR&CO'2013], Fri, 22 Apr 2016 07:13:07 GMT -->
<head>
<meta charset="utf-8">
<title>Cart</title>
<!--=================================
Meta tags
=================================-->
<meta name="description" content="">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta name="viewport" content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" />
<!--=================================
Style Sheets
=================================-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="assets/css/flags.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
.invalid{border:#FF0000 1px solid;}
</style>

<style>
  .ui-tooltip {padding: 10px;color: #333;font-size: 12px;background: #FFACAC ;}
</style>  

</head>
<body>

<%
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null){

}else user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("customer_id")) sessionID = cookie.getValue();
}
}
%>

<!--========================================
Quick view
===========================================-->
<div class="quickViewWrap xv-hide">
    <div class="quickView">
        <ul class="quickActions clearfix">
            <li title="Profile">
                <!--<span class="userAlerts-count qvCount">01</span>-->
                <a data-wide="true" href="#qvt-user">
                    <img src="assets/img/basic/avatar83.png" alt="">
                    <span>Login</span>
                </a>
            </li>
            <li title="shopping cart">
                <span class="cartItems-count qvCount">1</span>
                <a data-wide="false" href="#qvt-cart">
                    <img src="assets/img/basic/bag45.png" alt="">
                    <span>Your Cart</span>
                </a>
            </li>
            <li>
                <!--<span class="compare-count qvCount">03</span>-->
                <a data-wide="false" href="#qvt-wishlist" title="Wish List">
                    <img src="assets/img/basic/heart365.png" alt="">
                    <span>Your Wishlist</span>
                </a>
            </li>
            <li>
                <!--<span class="compare-count qvCount">03</span>-->
                <a data-wide="false" href="#qvt-compare" title="Compare List">
                    <img src="assets/img/basic/line.png" alt="">
                    <span>Compare List</span>
                </a>
            </li>
        </ul>
        
        <div class="quickviewTabs">
            
            <div id="qvt-user" class="qv-panel">
                <a href="#" class="closeQPanel"><i class="fa fa-close"></i></a>
                <form method="post" action="http://xvelopers.com/html/planet/Classic/login" id="login">
                    <p class="text-center"> <img src="assets/img/basic/padlock106.png" alt=""></p>
                    <input type="text" name="username" placeholder="Username" id="username">
                    <input type="password" name="password" placeholder="Password" id="password">
                    <a href="#" class="lost">Lost your password?</a><br><br>
                    <input type="submit" name="submit" value="Login" class="btn-blue btn">				
                </form>
            </div>
            
            <div id="qvt-cart" class="qv-panel">
                <a href="#" class="closeQPanel"><i class="fa fa-close"></i></a>
                <ul class="quickShoping-list">
                    <li>
                        <a data-pid="xyz101" data-qty="2" class="qv-remove-prod fa fa-remove" href="#"></a>
                        <a href="#"><img src="assets/img/news-img-2.png" alt=""></a>
                        <span>x2</span>
                    </li>
                </ul>
                
                <a href="#" class="btn btn-blue triggerCart" title="check out">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Visit Checkout Page</span>
                </a>
            </div>
            
            <div id="qvt-wishlist" class="qv-panel">
                <a href="#" class="closeQPanel"><i class="fa fa-close"></i></a>
                <ul class="quickShoping-list empty"></ul>
                <a href="#" class="btn btn-blue triggerCart" title="View Wishlist Page">
                    <i class="fa fa-heart"></i>
                    <span>Visit Checkout Page</span>
                </a>
            </div>
            
            <div id="qvt-compare" class="qv-panel">
                <a href="#" class="closeQPanel"><i class="fa fa-close"></i></a>
                <ul class="quickShoping-list empty"></ul>
                <a href="#" class="btn btn-blue triggerCompare" title="Compare Items">
                    <i class="fa fa-exchange"></i>
                    <span>Visit Checkout Page</span>
                </a>
            </div>
            
        </div>
    </div>
</div>    
<div class="qv-alert"><img src="assets/img/basic/shopping102.png" alt=""> Product Added Successfully</div>
<!--========================================
Header
===========================================-->
<!-- <div class="preHeader-promotions">
    <a href="#"><img src="assets/img/promo-banner.png" alt=""></a>
    <a href="#" class="closePromotions"></a>
</div>    --> 
    
<header class="doc-header header-light">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-7">
                    <ul class="top-nav">
                        <li><a href="#">Buyer Protection</a></li>
                        <li class="parent"><a href="#">Help</a>
                            <ul>
                                <li><a href="#">Help Center</a></li>
                                <li><a href="#">Open a Ticket</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Download Mobile App</a></li>
                        <li class="parent"><a href="#">Ship to <span class="cFlag-flag cFlag-th"><span class="country-text">Thailand</span></span> / THB </a>
                            <div class="regionalSetting mega-child"> 
                                <h6>Select Regional Settings</h6>
                                <span>Ship to</span>
                                <div class="countyList-wrap setting-switcher">
                                    <span class="triggerSwitch"><span class="cFlag-flag cFlag-th"><span class="country-text">Thailand</span></span></span>
                                    <ul>

                                        <li><span class="cFlag-flag cFlag-ru"><span class="country-text">Russian Federation</span></span></li>    
                                        <li><span class="cFlag-flag cFlag-us"><span class="country-text">United States</span></span></li>
                                        <li><span class="cFlag-flag cFlag-br"><span class="country-text">Brazil</span></span></li>
                                        <li><span class="cFlag-flag cFlag-au"><span class="country-text">Australia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-uk"><span class="country-text">United Kingdom</span></span></li>
                                        <li><span class="cFlag-flag cFlag-es"><span class="country-text">Spain</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fr"><span class="country-text">France</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ca"><span class="country-text">Canada</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pl"><span class="country-text">Poland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tr"><span class="country-text">Turkey</span></span></li>
                                        <li><span class="cFlag-flag cFlag-se"><span class="country-text">Sweden</span></span></li>
                                        <li><span class="cFlag-flag cFlag-il"><span class="country-text">Israel</span></span></li>
                                        <li><span class="cFlag-flag cFlag-it"><span class="country-text">Italy</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nz"><span class="country-text">New Zealand</span></span></li>
                                        <li><span class="cFlag-flag cFlag-de"><span class="country-text">Germany</span></span></li>
                                        <li><span class="cFlag-flag cFlag-af"><span class="country-text">Afghanistan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ala"><span class="country-text">Aland Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-al"><span class="country-text">Albania</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gba"><span class="country-text">Alderney</span></span></li>
                                        <li><span class="cFlag-flag cFlag-dz"><span class="country-text">Algeria</span></span></li>
                                        <li><span class="cFlag-flag cFlag-as"><span class="country-text">American Samoa</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ad"><span class="country-text">Andorra</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ao"><span class="country-text">Angola</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ai"><span class="country-text">Anguilla</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ag"><span class="country-text">Antigua and Barbuda</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ar"><span class="country-text">Argentina</span></span></li>
                                        <li><span class="cFlag-flag cFlag-am"><span class="country-text">Armenia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-aw"><span class="country-text">Aruba</span></span></li>
                                        <li><span class="cFlag-flag cFlag-asc"><span class="country-text">Ascension Island</span></span></li>
                                        <li><span class="cFlag-flag cFlag-au"><span class="country-text">Australia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-at"><span class="country-text">Austria</span></span></li>
                                        <li><span class="cFlag-flag cFlag-az"><span class="country-text">Azerbaijan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bs"><span class="country-text">Bahamas</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bh"><span class="country-text">Bahrain</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bd"><span class="country-text">Bangladesh</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bb"><span class="country-text">Barbados</span></span></li>
                                        <li><span class="cFlag-flag cFlag-by"><span class="country-text">Belarus</span></span></li>
                                        <li><span class="cFlag-flag cFlag-be"><span class="country-text">Belgium</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bz"><span class="country-text">Belize</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bj"><span class="country-text">Benin</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bm"><span class="country-text">Bermuda</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bt"><span class="country-text">Bhutan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bo"><span class="country-text">Bolivia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ba"><span class="country-text">Bosnia and Herzegovina</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bw"><span class="country-text">Botswana</span></span></li>
                                        <li><span class="cFlag-flag cFlag-br"><span class="country-text">Brazil</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bn"><span class="country-text">Brunei Darussalam</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bg"><span class="country-text">Bulgaria</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bf"><span class="country-text">Burkina Faso</span></span></li>
                                        <li><span class="cFlag-flag cFlag-bi"><span class="country-text">Burundi</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kh"><span class="country-text">Cambodia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cm"><span class="country-text">Cameroon</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ca"><span class="country-text">Canada</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cv"><span class="country-text">Cape Verde</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ky"><span class="country-text">Cayman Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cf"><span class="country-text">Central African Republic</span></span></li>
                                        <li><span class="cFlag-flag cFlag-td"><span class="country-text">Chad</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cl"><span class="country-text">Chile</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cx"><span class="country-text">Christmas Island</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cc"><span class="country-text">Cocos (Keeling) Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-co"><span class="country-text">Colombia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-km"><span class="country-text">Comoros</span></span></li>
                                        <li><span class="cFlag-flag cFlag-zr"><span class="country-text">Congo, The Democratic Republic Of The</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cg"><span class="country-text">Congo, The Republic of Congo</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ck"><span class="country-text">Cook Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cr"><span class="country-text">Costa Rica</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ci"><span class="country-text">Cote D'Ivoire</span></span></li>
                                        <li><span class="cFlag-flag cFlag-hr"><span class="country-text">Croatia (local name: Hrvatska)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cu"><span class="country-text">Cuba</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cy"><span class="country-text">Cyprus</span></span></li>
                                        <li><span class="cFlag-flag cFlag-cz"><span class="country-text">Czech Republic</span></span></li>
                                        <li><span class="cFlag-flag cFlag-dk"><span class="country-text">Denmark</span></span></li>
                                        <li><span class="cFlag-flag cFlag-dj"><span class="country-text">Djibouti</span></span></li>
                                        <li><span class="cFlag-flag cFlag-dm"><span class="country-text">Dominica</span></span></li>
                                        <li><span class="cFlag-flag cFlag-do"><span class="country-text">Dominican Republic</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tp"><span class="country-text">East Timor</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ec"><span class="country-text">Ecuador</span></span></li>
                                        <li><span class="cFlag-flag cFlag-eg"><span class="country-text">Egypt</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sv"><span class="country-text">El Salvador</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gq"><span class="country-text">Equatorial Guinea</span></span></li>
                                        <li><span class="cFlag-flag cFlag-er"><span class="country-text">Eritrea</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ee"><span class="country-text">Estonia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-et"><span class="country-text">Ethiopia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fk"><span class="country-text">Falkland Islands (Malvinas)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fo"><span class="country-text">Faroe Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fj"><span class="country-text">Fiji</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fi"><span class="country-text">Finland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fr"><span class="country-text">France</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gf"><span class="country-text">French Guiana</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pf"><span class="country-text">French Polynesia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ga"><span class="country-text">Gabon</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gm"><span class="country-text">Gambia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ge"><span class="country-text">Georgia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-de"><span class="country-text">Germany</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gh"><span class="country-text">Ghana</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gi"><span class="country-text">Gibraltar</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gr"><span class="country-text">Greece</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gl"><span class="country-text">Greenland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gd"><span class="country-text">Grenada</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gp"><span class="country-text">Guadeloupe</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gu"><span class="country-text">Guam</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gt"><span class="country-text">Guatemala</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ggy"><span class="country-text">Guernsey</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gn"><span class="country-text">Guinea</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gw"><span class="country-text">Guinea-Bissau</span></span></li>
                                        <li><span class="cFlag-flag cFlag-gy"><span class="country-text">Guyana</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ht"><span class="country-text">Haiti</span></span></li>
                                        <li><span class="cFlag-flag cFlag-hn"><span class="country-text">Honduras</span></span></li>
                                        <li><span class="cFlag-flag cFlag-hk"><span class="country-text">Hong Kong</span></span></li>
                                        <li><span class="cFlag-flag cFlag-hu"><span class="country-text">Hungary</span></span></li>
                                        <li><span class="cFlag-flag cFlag-is"><span class="country-text">Iceland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-in"><span class="country-text">India</span></span></li>
                                        <li><span class="cFlag-flag cFlag-id"><span class="country-text">Indonesia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ir"><span class="country-text">Iran (Islamic Republic of)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-iq"><span class="country-text">Iraq</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ie"><span class="country-text">Ireland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-il"><span class="country-text">Israel</span></span></li>
                                        <li><span class="cFlag-flag cFlag-it"><span class="country-text">Italy</span></span></li>
                                        <li><span class="cFlag-flag cFlag-jm"><span class="country-text">Jamaica</span></span></li>
                                        <li><span class="cFlag-flag cFlag-jp"><span class="country-text">Japan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-jey"><span class="country-text">Jersey</span></span></li>
                                        <li><span class="cFlag-flag cFlag-jo"><span class="country-text">Jordan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kz"><span class="country-text">Kazakhstan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ke"><span class="country-text">Kenya</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ki"><span class="country-text">Kiribati</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kw"><span class="country-text">Kuwait</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kg"><span class="country-text">Kyrgyzstan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-la"><span class="country-text">Lao People's Democratic Republic</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lv"><span class="country-text">Latvia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lb"><span class="country-text">Lebanon</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ls"><span class="country-text">Lesotho</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lr"><span class="country-text">Liberia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ly"><span class="country-text">Libya</span></span></li>
                                        <li><span class="cFlag-flag cFlag-li"><span class="country-text">Liechtenstein</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lt"><span class="country-text">Lithuania</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lu"><span class="country-text">Luxembourg</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mo"><span class="country-text">Macau</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mk"><span class="country-text">Macedonia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mg"><span class="country-text">Madagascar</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mw"><span class="country-text">Malawi</span></span></li>
                                        <li><span class="cFlag-flag cFlag-my"><span class="country-text">Malaysia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mv"><span class="country-text">Maldives</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ml"><span class="country-text">Mali</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mt"><span class="country-text">Malta</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mh"><span class="country-text">Marshall Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mq"><span class="country-text">Martinique</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mr"><span class="country-text">Mauritania</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mu"><span class="country-text">Mauritius</span></span></li>
                                        <li><span class="cFlag-flag cFlag-yt"><span class="country-text">Mayotte</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mx"><span class="country-text">Mexico</span></span></li>
                                        <li><span class="cFlag-flag cFlag-fm"><span class="country-text">Micronesia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-md"><span class="country-text">Moldova</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mc"><span class="country-text">Monaco</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mn"><span class="country-text">Mongolia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mne"><span class="country-text">Montenegro</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ms"><span class="country-text">Montserrat</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ma"><span class="country-text">Morocco</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mz"><span class="country-text">Mozambique</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mm"><span class="country-text">Myanmar</span></span></li>
                                        <li><span class="cFlag-flag cFlag-na"><span class="country-text">Namibia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nr"><span class="country-text">Nauru</span></span></li>
                                        <li><span class="cFlag-flag cFlag-np"><span class="country-text">Nepal</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nl"><span class="country-text">Netherlands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-an"><span class="country-text">Netherlands Antilles</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nc"><span class="country-text">New Caledonia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nz"><span class="country-text">New Zealand</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ni"><span class="country-text">Nicaragua</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ne"><span class="country-text">Niger</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ng"><span class="country-text">Nigeria</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nu"><span class="country-text">Niue</span></span></li>
                                        <li><span class="cFlag-flag cFlag-nf"><span class="country-text">Norfolk Island</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kp"><span class="country-text">North Korea</span></span></li>
                                        <li><span class="cFlag-flag cFlag-mp"><span class="country-text">Northern Mariana Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-no"><span class="country-text">Norway</span></span></li>
                                        <li><span class="cFlag-flag cFlag-om"><span class="country-text">Oman</span></span></li>
                                        <li><span class="cFlag-flag cFlag-other"><span class="country-text">Other Country</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pk"><span class="country-text">Pakistan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pw"><span class="country-text">Palau</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ps"><span class="country-text">Palestine</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pa"><span class="country-text">Panama</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pg"><span class="country-text">Papua New Guinea</span></span></li>
                                        <li><span class="cFlag-flag cFlag-py"><span class="country-text">Paraguay</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pe"><span class="country-text">Peru</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ph"><span class="country-text">Philippines</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pl"><span class="country-text">Poland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pt"><span class="country-text">Portugal</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pr"><span class="country-text">Puerto Rico</span></span></li>
                                        <li><span class="cFlag-flag cFlag-qa"><span class="country-text">Qatar</span></span></li>
                                        <li><span class="cFlag-flag cFlag-re"><span class="country-text">Reunion</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ro"><span class="country-text">Romania</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ru"><span class="country-text">Russian Federation</span></span></li>
                                        <li><span class="cFlag-flag cFlag-rw"><span class="country-text">Rwanda</span></span></li>
                                        <li><span class="cFlag-flag cFlag-blm"><span class="country-text">Saint Barthelemy</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kn"><span class="country-text">Saint Kitts and Nevis</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lc"><span class="country-text">Saint Lucia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-maf"><span class="country-text">Saint Martin</span></span></li>
                                        <li><span class="cFlag-flag cFlag-vc"><span class="country-text">Saint Vincent and the Grenadines</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ws"><span class="country-text">Samoa</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sm"><span class="country-text">San Marino</span></span></li>
                                        <li><span class="cFlag-flag cFlag-st"><span class="country-text">Sao Tome and Principe</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sa"><span class="country-text">Saudi Arabia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sct"><span class="country-text">Scotland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sn"><span class="country-text">Senegal</span></span></li>
                                        <li><span class="cFlag-flag cFlag-srb"><span class="country-text">Serbia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sc"><span class="country-text">Seychelles</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sl"><span class="country-text">Sierra Leone</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sg"><span class="country-text">Singapore</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sk"><span class="country-text">Slovakia (Slovak Republic)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-si"><span class="country-text">Slovenia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sb"><span class="country-text">Solomon Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-so"><span class="country-text">Somalia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-za"><span class="country-text">South Africa</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sgs"><span class="country-text">South Georgia and the South Sandwich Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-kr"><span class="country-text">South Korea</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ss"><span class="country-text">South Sudan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-es"><span class="country-text">Spain</span></span></li>
                                        <li><span class="cFlag-flag cFlag-lk"><span class="country-text">Sri Lanka</span></span></li>
                                        <li><span class="cFlag-flag cFlag-pm"><span class="country-text">St. Pierre and Miquelon</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sd"><span class="country-text">Sudan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sr"><span class="country-text">Suriname</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sz"><span class="country-text">Swaziland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-se"><span class="country-text">Sweden</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ch"><span class="country-text">Switzerland</span></span></li>
                                        <li><span class="cFlag-flag cFlag-sy"><span class="country-text">Syrian Arab Republic</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tw"><span class="country-text">Taiwan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tj"><span class="country-text">Tajikistan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tz"><span class="country-text">Tanzania</span></span></li>
                                        <li><span class="cFlag-flag cFlag-th"><span class="country-text">Thailand</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tls"><span class="country-text">Timor-Leste</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tg"><span class="country-text">Togo</span></span></li>
                                        <li><span class="cFlag-flag cFlag-to"><span class="country-text">Tonga</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tt"><span class="country-text">Trinidad and Tobago</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tn"><span class="country-text">Tunisia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tr"><span class="country-text">Turkey</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tm"><span class="country-text">Turkmenistan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tc"><span class="country-text">Turks and Caicos Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-tv"><span class="country-text">Tuvalu</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ug"><span class="country-text">Uganda</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ua"><span class="country-text">Ukraine</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ae"><span class="country-text">United Arab Emirates</span></span></li>
                                        <li><span class="cFlag-flag cFlag-uk"><span class="country-text">United Kingdom</span></span></li>
                                        <li><span class="cFlag-flag cFlag-us"><span class="country-text">United States</span></span></li>
                                        <li><span class="cFlag-flag cFlag-uy"><span class="country-text">Uruguay</span></span></li>
                                        <li><span class="cFlag-flag cFlag-uz"><span class="country-text">Uzbekistan</span></span></li>
                                        <li><span class="cFlag-flag cFlag-vu"><span class="country-text">Vanuatu</span></span></li>
                                        <li><span class="cFlag-flag cFlag-va"><span class="country-text">Vatican City State (Holy See)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ve"><span class="country-text">Venezuela</span></span></li>
                                        <li><span class="cFlag-flag cFlag-vn"><span class="country-text">Vietnam</span></span></li>
                                        <li><span class="cFlag-flag cFlag-vg"><span class="country-text">Virgin Islands (British)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-vi"><span class="country-text">Virgin Islands (U.S.)</span></span></li>
                                        <li><span class="cFlag-flag cFlag-wf"><span class="country-text">Wallis And Futuna Islands</span></span></li>
                                        <li><span class="cFlag-flag cFlag-ye"><span class="country-text">Yemen</span></span></li>
                                        <li><span class="cFlag-flag cFlag-yu"><span class="country-text">Yugoslavia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-zm"><span class="country-text">Zambia</span></span></li>
                                        <li><span class="cFlag-flag cFlag-eaz"><span class="country-text">Zanzibar</span></span></li>
                                        <li><span class="cFlag-flag cFlag-zw"><span class="country-text">Zimbabwe</span></span></li>        

                                    </ul>
                                </div><!--countries-->
                                <span>Currency</span>
                                <div class="currencyList-wrap setting-switcher">
                                    <span class="triggerSwitch"><em>THB</em> (฿)</span>
                                    <ul>
                                        <li data-currency="USD"><em>USD</em> ($)</li>
                                        <li data-currency="RUB"><em>RUB</em> (ÑÑÐ±)</li>
                                        <li data-currency="GBP"><em>GBP</em> (Â£)</li>
                                        <li data-currency="BRL"><em>BRL</em> (R$)</li>
                                        <li data-currency="CAD"><em>CAD</em> ($)</li>
                                        <li data-currency="AUD"><em>AUD</em> ($)</li>
                                        <li data-currency="EUR"><em>EUR</em> (â¬)</li>
                                        <li data-currency="INR"><em>INR</em> (Rs)</li>
                                        <li data-currency="UAH"><em>UAH</em> (â´)</li>
                                        <li data-currency="JPY"><em>JPY</em> (Â¥)</li>
                                        <li data-currency="MXN"><em>MXN</em> ($)</li>
                                        <li data-currency="IDR"><em>IDR</em> (Rp)</li>
                                        <li data-currency="TRY"><em>TRY</em> (TL)</li> 
                                    </ul>
                                </div> 
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-5">
                    <ul class="top-nav text-right">
                        <li><a href="#"><i class="fa fa-exchange"></i>listing</a></li>
                        <li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
                        <li><a href="login.jsp"><i class="fa fa-money"></i><span class="ktb">iKTB</span><b>PAY</b></a></li>
                        <li><a href="#"><i class="fa fa-lock"></i>Register</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div><!--top header-->
    <div class="header-bottom">
        <div class="container">
            <a class="logo" href="index.jsp">
                <img src="assets/img/logo.png" alt=""/>
            </a>
           <nav>
                <a class="nav-triger" href="#">
                    <img src="assets/img/basic/menu55.png" alt="">
                </a>
                <ul class="main_menu">
                    <li class="home-dropdown"><a href="#">KTB e-market</a>
                        <ul>
                            <li><a href="">KTB e-market</a></li>
                            <li><a href="">KTB products</a></li>
                            <li><a href="">KTB users</a></li>
                            <li><a href="">KTB Product Detail</a></li>
                            <li><a href="">KTB Shop Archive</a></li>
                            <li><a href="">KTB Shop Cart</a></li>
                            <li><a href="">KTB Shop</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Best Sellers</a></li>
                    <li><a href="#">Feature Brands</a></li>
                    <li><a href="#">Planet Collections</a></li>
                </ul>
                <a href="#" class="openCart"></a>
                <div class="table-responsive cart-calculations  text-center">
                  <table class="table">
                        <tbody class="shadow-around">
                        <c:forEach items="${cart}" var="product">
                        <tr class="table-body">
                        <td><figure><img src="<c:out value="${product.imagepath}"/>" alt=""/></figure></td>
                        <td>
                            <div class="cart-wrappper text-left">
                                <h6><c:out value="${product.name}"/></h6>
                                <p><span>Availability</span>: Available in Stock</p>
                                <p><span>Product Code</span>: CwT4a</p> 
                            </div>     
                        </td>
                        <td>
                            <div class="quantity-control">
                                <span class="btn-cart btn-square btn-plus btn-qty"><i class="fa fa-plus"></i></span>
                                <input type="text" value="1" data-min="1" data-minalert="Minimum limit reached" data-max="10" data-maxalert="Maximum limit reached" data-invalid="Enter valid quantity">
                                <span class="btn-cart btn-square btn-minus btn-qty"><i class="fa fa-minus"></i></span>                      
                            </div>
                        </td>
                        <td>
                            <span class="cart-content">Unit Price:</span>
                            <span class="cart-price">฿<c:out value="${product.unitPrice}"/></span>
                        </td>
                        <td>
                            <span class="cart-content">Sub Price:</span>
                            <span class="cart-price">฿<c:out value="${product.unitPrice}"/></span>
                        </td>
                        <td>
                            <a class="cart-action" href="#"><i class="fa fa-trash-o"></i></a>
                        </td>
                      </tr>
                      
                      </c:forEach>
                        
                        
                        <tr class="table-body style">
                            <td></td>
                            <td>
                                <a href="cart.jsp" class="btn-cart btn-rectangle">View Cart</a>
                                <a href="checkout.jsp" class="btn-cart btn-rectangle">Checkout</a>
                            </td>
                            <td></td>
                            <td></td>
                             <c:set var="htotal" value="0" />
                             <c:forEach items="${cart}" var="product">
                             <c:set var="htotal" value="${htotal+product.unitPrice}" />
                             </c:forEach>
                            <td class="style">TOTAL:<span class="colpink">฿${htotal}</span></td>
                            <td></td>
                        </tr>
                      </tbody>
                  </table>
               </div>
            </nav>
        </div>
    </div><!--header Bottom-->
</header><!--document Header-->   
<!--========================================
Search
===========================================-->

<div class="social-search style shadow-around style-wide">
    <div class="container">
            <div class="social">
                <span>Welcome to KTB e-market<br>Phone: (+6000) 6146 - 6000</span>
                <ul>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                </ul><!--ul-->
            </div><!--social-->
            <form class="search-form">
                <div class="custome-select">
                    <b class="fa fa-caret-down"></b>
                    <span>Select a Category</span>
                    <select class="search-cate notranslate" id="search-dropdown-box">
                       <option value="">All Categories</option>
                       <option value="">Women's Clothing &amp; Accessories</option>
                       <option value="">Men's Clothing &amp; Accessories</option>
                       <option value="">Phones &amp; Telecommunications</option>
                       <option value="">Computer &amp; Office</option>
                       <option value="">Consumer Electronics</option>
                       <option value="">Jewelry</option>
                       <option value="">Home &amp; Garden</option>
                       <option value="">Luggage &amp; Bags</option>
                       <option value="">Shoes</option>
                       <option value="">Mother &amp; Kids</option>
                       <option value="">Sports &amp; Entertainment</option>
                       <option value="">Health &amp; Beauty</option>
                       <option value="">Watches</option>
                       <option value="">Toys &amp; Hobbies</option>
                       <option value="">Weddings &amp; Events</option>
                       <option value="">Novelty &amp; Special Use</option>
                       <option value="">Automobiles &amp; Motorcycles</option>
                       <option value="">Lights &amp; Lighting</option>
                       <option value="">Furniture</option>
                       <option value="">Industry &amp; Business</option>
                       <option value="">Electronic Components &amp; Supplies</option>
                       <option value="">Office &amp; School Supplies</option>
                       <option value="">Electrical Equipment &amp; Supplies</option>
                       <option value="">Gifts &amp; Crafts</option>
                       <option value="">Home Improvement</option>
                       <option value="">Food</option>
                       <option value="">Travel and Vacations</option>
                       <option value="">In All Categories</option>
                    </select>
                </div>
                <input type="text" placeholder="I am searching for...">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form><!--search-form-->
    </div><!--container-->
</div><!--social-search-->
<div class="clearfix"></div>   
   
  
<!--=======Page Content Area=========-->   
<main id="pageContentArea">
<!--========================================
Page Head
===========================================-->
    <div class="blog-main-slider color-white text-center" style="background-image:url('assets/img/b17.jpg'); no-repeat">
        <div class="overlay"></div>
        <div class="container">
            <h2>iKTBPAY</h2>
            <p>Aenean sollicitudin, nec sagittis sem lorem quist bibe dum auctor.</p>
        </div>
    </div>
<!--========================================
cart content
===========================================-->

    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-10">
                <div class="checkbox-form login">
                    <h3 class="checkbox-title">Enter iKTB Login details</h3>
                        <div class="row">
                                 <% if (session.getAttribute("user") != null) { %>
                                 
                                <div class="col-md-12">
                                    <button class="btn btn-send btn-pink" onclick="btnclickLogout();" >LOGOUT</button>
                                </div>   
                                
                                <div class="col-md-16">
								   <p class="form-row">
                                        <label>Logged in successfully : <%= session.getAttribute("user") %> </label>
                                   </p>
                                </div>   
								 <% } else {%>
								 <div class="col-md-6">
                                    <p class="form-row">
                                        <label>Email Address<span class="required">*</span></label>
                                        <input id="emailU"  type="text" placeholder="Email">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="form-row">
                                        <label>Password<span class="required">*</span></label>
                                        <input id="passwordU" type="password" placeholder="Password">
                                    </p>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-send btn-pink" onclick="btnclick();" >LOGIN</button>
                                </div>   
                                
                                <div class="col-md-12">
                                  <p class="form-row" id = "loginStatus" >
                                   </p>
                                </div>  
                                
								<% } %>
                                
                            </div><!--row-->      
                </div><!--checkbox-form-->
            </div><!--col-lg-->
            <div class="col-lg-6 col-md-6 col-sm-12 col-lg-offset-1">
                    <div class="ktb-registration" >
                        <h3 class="registration-title">Register for iKTB account</h3>
                        <div class="row" id="frmContact">
                                <div class="col-md-6">
                                    <p class="form-row">
                                        <label>First Name<span class="required">*</span></label>
                                        <input id="field1" type="text"  minlength="2" type="text" required="true">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="form-row">
                                        <label>Last Name<span class="required">*</span></label>
                                        <input id="field2" type="text"  minlength="2" type="text" required="true">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="form-row">
                                        <label>Email Address<span class="required">*</span></label>
                                        <input id="field3" type="email" placeholder="Email" required="true">
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="form-row">
                                        <label>Password<span class="required">*</span></label>
                                        <input id="field4" type="password" minlength="5" maxlength="20" placeholder="Password" required="true">
                                    </p>
                                </div>
                                <div class="col-md-12">
                                    <p class="form-row">
                                        <label>Company Name</label>
                                        <input  id="field5" type="text">
                                    </p>
                                </div>
                                    <div class="col-md-12">
                                        <p class="form-row">
                                            <label>Address</label>
                                            <input id="field6" type="text" placeholder="Street address" >
                                            <input id="field7" type="text" placeholder="Apartment, suite, unit etc. (optional)">
                                        </p>
                                    </div>
                                <div class="col-md-12">
                                    <button class="btn btn-send btn-pink"  onclick="btnclickRegister();" >REGISTER</button>
                                </div>   
                                 <div class="col-md-12">
                                  <p class="form-row" id = "resultStatus" >
                                   </p>
                                </div>   
                                
                            </div><!--row-->
                        </div> 
           			 </div><!--col-->  
        </div><!--row-->
    </div><!--container-->
</main>
<!--========================================
Footer
===========================================-->
    
<footer class="doc-footer">
    <div class="footer-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="contact">
                    <a class="ft-logo pb-20" href="#"><img src="assets/img/footer-logo-dark.png" alt=""></a>
                        <ul class="no-preIcon customeIconList pt-30">
                            <li>
                                <i class="fa fa-phone"></i>
                                <a href="tel:(+800)5146-9000">(+800)5146-9000</a>
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                <a href="mailto:hieupv@outlook.com">contact@ktb.com</a>
                            </li>
                            <li>
                                <i class="fa fa-map-marker"></i>
                               85 Bechole Road - Victory - Thailand
                            </li>
                            <li>
                                <i class="fa fa-map-marker"></i>
                                85 Giang Vo str - Ba Dinh
                            </li>
                        </ul>
                    </div><!--content-->
                </div><!--column-3-->
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <h4 class="no-mar">Information</h4>
                    <ul class="mt-25">
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Delivery Information</a></li>
                        <li><a href="#">Privacy & Policy</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Manufactures</a></li>
                    </ul>
                </div><!--column-3-->
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <h4 class="no-mar">Extras</h4>
                    <ul class="mt-25">
                        <li><a href="#">Order & Returns</a></li>
                        <li><a href="#">Search Terms</a></li>
                        <li><a href="#">Advance Search</a></li>
                        <li><a href="#">Affiliates</a></li>
                        <li><a href="#">Group Sales</a></li>
                    </ul>
                </div><!--column-3-->
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <h4 class="no-mar">My Accounts</h4>
                    <ul class="mt-25">
                        <li><a href="#">My account</a></li>
                        <li><a href="#">Login</a></li>
                        <li><a href="#">My Cart</a></li>
                        <li><a href="#">Wishlist</a></li>
                        <li><a href="#">Checkout</a></li>
                    </ul>
                </div><!--column-3-->
            </div><!--row-->
        </div><!--container-->
    </div><!--footer-content-->
    <div class="copy-rights color-white">
        <div class="container">
            <div class="inner">
               <div class="row">
                   <div class="col-xs-12 col-md-6 col-sm-6 col-xs-12">
                       <span>Copyright &copy; KTB e-market 2016. All Right Reserved</span>
                   </div><!--column-6-->
                   <div class="col-xs-12 col-md-6 col-sm-6 col-xs-12">
<!--                         <ul class="clearfix">
                            <li><img src="assets/img/apple.png" alt=""></li>
                            <li><img src="assets/img/visa.png" alt=""></li>
                            <li><img src="assets/img/paypal.png" alt=""></li>
                            <li><img src="assets/img/master-card.png" alt=""></li>
                        </ul> -->
                   </div><!--column-6-->
                </div><!--row-->
            </div><!--inner-->
        </div><!--container-->
    </div><!--copy-rights-->
</footer><!--doc-footer-->


<!--=================================
Script Source
=================================-->

<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery.easing-1.3.pack.js"></script>
<script src="assets/js/jquery.countdown.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/main.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/zepto/1.0/zepto.min.js'></script>
<script src="resources/js/index.js"></script>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript">

		$(document).ready(function(){
		
			});
		
		
		function validateContact() {
			var valid = true;
			$("#frmContact input[required=true], #frmContact textarea[required=true]").each(function(){
				$(this).removeClass('invalid');
				
				$(this).css({
	                    "border": "",
	                });

				$(this).attr('title','');
				if(!$(this).val()){ 
					$(this).addClass('invalid');
					 $(this).css({
	                     "border": "1px solid red",
				    });
					$(this).attr('title','This field is required');
					valid = false;
				}
				if($(this).attr("type")=="email" && !$(this).val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)){
					$(this).addClass('invalid');
					 $(this).css({
	                     "border": "1px solid red",
				    });
					$(this).attr('title','Enter valid email');
					valid = false;
				}  
			}); 
			return valid;
		}

		  $(function() {
		    $( document ).tooltip({
				position: {my: "left top", at: "right top"},
			  items: "input[required=true], textarea[required=true]",
		      content: function() { return $(this).attr( "title" ); }
		    });
		  });
		  
		
		 function btnclick() {
			  console.log("btnclick"); 
			  var user = document.getElementById('emailU')
			  var pass = document.getElementById('passwordU')
			  console.log(user.value+","+pass.value); 
			  
			  $("body").css("cursor", "progress");
			  $.ajax({
				  url: "LoginServlet.do",
				  type: "post",
				  data: "user="+user.value+"&pwd="+pass.value,
				  success: function(json) {
					  $("body").css("cursor", "default");
					  console.log('success'); 
					  console.log(json.status);   // needs to match the payload (i.e. json must have {value: "foo"}
					  var str = json.status;
					  if (str.indexOf("success") >= 0) {
						  location.reload();
					  }else{
						  document.getElementById("loginStatus").innerHTML = json.status;
					  }
					},
				  error:function(){
					  $("body").css("cursor", "default");
					  console.log('failed'); 
					  document.getElementById("loginStatus").innerHTML = 'Error Login Failed';
				  }   
				}); 
		  }
		  
			
		  function btnclickLogout() {
			  console.log("btnclickLogout"); 
			  window.location = "LogoutServlet.do"; 
		  }
		  
		  function btnclickRegister() {
			  
				var valid;	
				valid = validateContact();

				if(valid) {
					
					  var firstn = document.getElementById('field1')
					  var lastn = document.getElementById('field2')
					  var emailn = document.getElementById('field3')
					  var passwordn = document.getElementById('field4')
					  
					  console.log(firstn.value); 
					  console.log(lastn.value); 
					  console.log(emailn.value); 
					  console.log(passwordn.value); 
					  
					  $("body").css("cursor", "progress");
					  
					  $.ajax({
						  url: "RegisterServlet.do",
						  type: "post",
						  data: "fn="+firstn.value+"&ln="+lastn.value+"&em="+emailn.value+"&ps="+passwordn.value,
						  success: function(json) {
							  $("body").css("cursor", "default");
							  console.log('success'); 
							  console.log(json.status);   // needs to match the payload (i.e. json must have {value: "foo"}
							  console.log(json.customer_id);  
							  var str = json.status;
							  if (str.indexOf("Success") >= 0) {
								  location.reload();
							  }else{
								  document.getElementById("resultStatus").innerHTML = json.status;
							  }
							  document.getElementById("resultStatus").innerHTML = 'Registered Succesfully';
						  },
						  error:function(){
							  $("body").css("cursor", "default");
							  console.log('failed'); 
							  document.getElementById("resultStatus").innerHTML = 'Error while submit';
						  }   
						}); 
		
				  }
		  }
		  
</script>
  
  
</body>
</html>