<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6cr1le65u"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=o6cr1le65u&submodules=geocoder"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
*[data-animation="ripple"] {
    height: 35px;
    width: 55px;;
    display: block;
    outline: none;
    margin-top:30px;
    padding-top:6px;
    color: #fff;
    text-transform: uppercase;
    background: white;
    box-sizing: border-box;
    text-align: center;
    line-height: 14px;
    font-family: roboto, helvetica;
    font-weight: 200;
    letter-spacing: 1px;
    text-decoration: none;
    cursor: pointer;
  /*border-radius: 50px;*/
    -webkit-tap-highlight-color: transparent;
    border-radius: 20px;
    border: 0px solid white;
    position: absolute;
}

*[data-animation="ripple"]:focus{
    outline: none;
}

*[data-animation="ripple"]::selection {
    background: transparent;
    pointer-events: none;
}
input[type=text]:focus{
	outline:none;
}
</style>
<script>
	window["tmripple"] =
		/******/ (function(modules) { // webpackBootstrap
		/******/    // The module cache
		/******/    var installedModules = {};
		/******/
		/******/    // The require function
		/******/    function __webpack_require__(moduleId) {
		/******/
		/******/        // Check if module is in cache
		/******/        if(installedModules[moduleId]) {
		/******/            return installedModules[moduleId].exports;
		/******/        }
		/******/        // Create a new module (and put it into the cache)
		/******/        var module = installedModules[moduleId] = {
		/******/            i: moduleId,
		/******/            l: false,
		/******/            exports: {}
		/******/        };
		/******/
		/******/        // Execute the module function
		/******/        modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
		/******/
		/******/        // Flag the module as loaded
		/******/        module.l = true;
		/******/
		/******/        // Return the exports of the module
		/******/        return module.exports;
		/******/    }
		/******/
		/******/
		/******/    // expose the modules object (__webpack_modules__)
		/******/    __webpack_require__.m = modules;
		/******/
		/******/    // expose the module cache
		/******/    __webpack_require__.c = installedModules;
		/******/
		/******/    // define getter function for harmony exports
		/******/    __webpack_require__.d = function(exports, name, getter) {
		/******/        if(!__webpack_require__.o(exports, name)) {
		/******/            Object.defineProperty(exports, name, {
		/******/                configurable: false,
		/******/                enumerable: true,
		/******/                get: getter
		/******/            });
		/******/        }
		/******/    };
		/******/
		/******/    // getDefaultExport function for compatibility with non-harmony modules
		/******/    __webpack_require__.n = function(module) {
		/******/        var getter = module && module.__esModule ?
		/******/            function getDefault() { return module['default']; } :
		/******/            function getModuleExports() { return module; };
		/******/        __webpack_require__.d(getter, 'a', getter);
		/******/        return getter;
		/******/    };
		/******/
		/******/    // Object.prototype.hasOwnProperty.call
		/******/    __webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
		/******/
		/******/    // __webpack_public_path__
		/******/    __webpack_require__.p = "";
		/******/
		/******/    // Load entry module and return exports
		/******/    return __webpack_require__(__webpack_require__.s = 0);
		/******/ })
		/************************************************************************/
		/******/ ([
		/* 0 */
		/***/ (function(module, exports, __webpack_require__) {

		"use strict";


		// Default Settings
		var settings = {
		    area: "",
		    color: "rgba(255, 255, 255, 0.4)",
		    offsetEl: null,
		    eventListener: "click",
		    mouseMove: false
		};

		/**
		 * @description Where the magic happens
		 * @param {object} e
		 * @param {string} rippleColor
		 * @param {string} eventListener
		 */
		function ripple(e, rippleColor, eventListener) {
		    var clickedEl = e.currentTarget;
		    var PageX = eventListener.match(/touch/) ? e.changedTouches[0].pageX : e.clientX;
		    var PageY = eventListener.match(/touch/) ? e.changedTouches[0].pageY : e.clientY;
		    var btnWidth = clickedEl.clientWidth;
		    var el = clickedEl.getBoundingClientRect();
		    var rippleOffset = settings.offsetEl ? settings.offsetEl.clientHeight : 0;
		    var btnOffsetTop = el.top + rippleOffset;
		    var btnOffsetLeft = el.left;
		    var posMouseX = PageX;
		    var posMouseY = PageY + rippleOffset;
		    var rippleX = posMouseX - btnOffsetLeft;
		    var rippleY = posMouseY - btnOffsetTop;

		    var baseCSS = "\n          position: absolute;\n          width: " + btnWidth * 2 + "px;\n          height: " + btnWidth * 2 + "px;\n          border-radius: 50%;\n          transition: transform 700ms, opacity 700ms;\n          transition-timing-function: cubic-bezier(0.250, 0.460, 0.450, 0.940);\n          background: " + rippleColor + ";\n          background-position: center;\n          background-repeat: no-repeat;\n          background-size: 100%;\n          left: " + (rippleX - btnWidth) + "px;\n          top: " + (rippleY - btnWidth) + "px;\n          transform: scale(0);\n          pointer-events: none;\n      ";

		    // Prepare the dom
		    var rippleEffect = document.createElement("span");
		    rippleEffect.style.cssText = baseCSS;

		    // Add some css for prevent overflow errors
		    clickedEl.style.overflow = "hidden";

		    // Check if the element is not static because the ripple is in absolute
		    if (window.getComputedStyle(clickedEl).position === "static") {
		        clickedEl.style.position = "relative";
		    }

		    // Check for the mousemove event
		    if (settings.mouseMove) {
		        settings.mouseMove = false;
		        return;
		    }

		    clickedEl.appendChild(rippleEffect);

		    // start animation
		    requestAnimationFrame(function () {
		        rippleEffect.style.cssText = baseCSS + " transform: scale(1); opacity: 0;";
		    });

		    setTimeout(function () {
		        rippleEffect.remove();
		    }, 700);
		}

		/**
		 * @description Prevent ripple when scrolling (Mobile Only)
		 * @param {string} eventListener
		 */
		function onDrag(eventListener) {
		    if (eventListener === "touchend") {
		        document.getElementsByTagName("body")[0].addEventListener("touchmove", function () {
		            settings.mouseMove = true;
		        });
		    }
		}

		function attachRipple(els, rippleColor, eventListener) {
		    for (var i = 0; i < els.length; i += 1) {
		        var currentBtn = els[i];
		        currentBtn.addEventListener(eventListener, function (e) {
		            return ripple(e, rippleColor, eventListener);
		        });
		    }
		}

		function attachRippleToAttribute(area, rippleColor, eventListener) {
		    var attributeEl = document.querySelectorAll(area + " [data-animation='ripple']");

		    if (attributeEl.length > 0) {
		        attachRipple(attributeEl, rippleColor, eventListener);
		    } else {
		        throw new Error('not found any element with data-animation="ripple"');
		    }
		}

		function attachRippleToSelectors(selectors, rippleColor, eventListener) {
		    if (selectors) {
		        var selectorsEl = document.querySelectorAll(selectors);
		    } else {
		        throw new Error("You have to enter at least 1 selector");
		    }

		    if (selectorsEl.length > 0) {
		        attachRipple(selectorsEl, rippleColor, eventListener);
		    } else {
		        console.warn("No element found with this selector: ", selectors);
		    }
		}

		module.exports = {
		    init: function init() {
		        var data = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};

		        try {
		            var area = settings.area,
		                color = settings.color,
		                offsetEl = settings.offsetEl,
		                eventListener = settings.eventListener;


		            area = data.area || area;
		            color = data.color || color;
		            offsetEl = data.offsetEl ? this.setOffsetEl(data.offsetEl) : offsetEl;
		            eventListener = data.eventListener || eventListener;

		            onDrag(eventListener);
		            attachRippleToAttribute(area, color, eventListener);
		        } catch (e) {
		            console.warn(e.message);
		        }
		    },
		    attachToSelectors: function attachToSelectors() {
		        var data = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};

		        try {
		            var elSetting = {
		                color: data.color || settings.color,
		                eventListener: data.eventListener || settings.eventListener
		            };
		            var color = elSetting.color,
		                eventListener = elSetting.eventListener;


		            attachRippleToSelectors(data.selectors, color, eventListener);
		        } catch (e) {
		            console.warn(e.message);
		        }
		    },
		    setOffsetEl: function setOffsetEl(el) {
		        settings.offsetEl = document.querySelector(el);
		    },

		    ripple: ripple
		};

		/***/ })
		/******/ ]);

		tmripple.init()
	</script>
</head>
<body>
	<div id="map"
		style="width: 100%; height: 700px; display: inline; position: absolute; z-index: 10;"></div>


<script>
/*
	function enterkey(value){
	if (window.event.keyCode == 13) {
		realaddress = $("#11").val();
		if(value == "양재역"){
			console.log(value);
			console.log(realaddress);
			value = "남부순환로 2585";
		}
		reserve(value);
    }
}
function reserve(realaddress){
	naver.maps.Service.geocode({
	    address: realaddress
	}, function(status, response) {
	    if (status !== naver.maps.Service.Status.OK) {
	        return alert('Something wrong!');
	    }
	    var result = response.result; // 검색 결과의 컨테이너
	    var items = result.items; // 검색 결과의 배열
		pointx = result['items'][0]['point']['x'];
	    pointy = result['items'][0]['point']['y'];
	    var mapOptions = {
	    	   center: new naver.maps.LatLng(pointy, pointx),
	    	    zoom: 15
	    	};

	    var map = new naver.maps.Map('map', {
	    	   center: new naver.maps.LatLng(pointy, pointx),
	    	    zoom: 15
	    	});

	    var marker = new naver.maps.Marker({
	    	   position: new naver.maps.LatLng(pointy, pointx),
	    	    map: map
	    	});
		
	    var locationBtnHtml2 = '<div style="width: 400px; height: 50px; padding-left:30px;"><a data-animation="ripple" style="margin-left:5px;margin-top:10px;" align="center"><img src="images/searchicon.png" style="width:20px; height:20px; padding-bottom:5px;"></a><input onkeyup="enterkey(this.value);" id="11" type="text"style="display: inline; width: 70%; border-radius: 5em; border:1px solid gray;height: 100%; padding-left: 60px;"placeholder="YUMEET 맛집 검색"></div>';


	    naver.maps.Event.once(map, 'init_stylemap', function() {
	        //customControl 객체 이용하기
	        var customControl2 = new naver.maps.CustomControl(locationBtnHtml2, {
	            position: naver.maps.Position.TOP_LEFT
	        });
	        customControl2.setMap(map);
			naver.maps.Event.addDOMListener(customControl2.getElement(),'click', function(){
				
			});
	    });
	});
} */

var pointxs = [];
var pointys = [];
var realaddress = ["테헤란로14길 6", "역삼동 735-1"];

for(var i = 0; i < realaddress.length; i ++){
	naver.maps.Service.geocode({
	    address: realaddress[i]
	}, function(status, response) {
	    if (status !== naver.maps.Service.Status.OK) {
	        return alert('Something wrong!');
	    }
	    var result = response.result; // 검색 결과의 컨테이너
	    var items = result.items; // 검색 결과의 배열
		var pointx = result['items'][0]['point']['x'];
	    var pointy = result['items'][0]['point']['y'];
	    pointxs.push(pointx);
	    pointys.push(pointy);
	    console.log(pointxs);
	    console.log(pointys);
	});
}

var HOME_PATH = window.HOME_PATH || '.';
var MARKER_SPRITE_X_OFFSET = 29,
    MARKER_SPRITE_Y_OFFSET = 50,
    MARKER_SPRITE_POSITION = {
        "A0": [pointys[1], pointxs[1]],
        "B0": [MARKER_SPRITE_X_OFFSET, 0],
        "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
        "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
        "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
        "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
        "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
        "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
        "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

        "A1": [0, MARKER_SPRITE_Y_OFFSET],
        "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
        "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
        "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
        "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
        "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
        "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
        "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
        "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

        "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
        "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
        "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
        "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
        "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
        "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
        "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
        "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
        "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
    };

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng("37.4990054", "127.0328691"),
    zoom: 15
});
var bounds = map.getBounds(),
    southWest = bounds.getSW(),
    northEast = bounds.getNE(),
    lngSpan = northEast.lng() - southWest.lng(),
    latSpan = northEast.lat() - southWest.lat();
	console.log(lngSpan);
	console.log(latSpan)
var markers = [];

for (var key in MARKER_SPRITE_POSITION) {

    var position = new naver.maps.LatLng(
        southWest.lat() + latSpan * Math.random(),
        southWest.lng() + lngSpan * Math.random());

    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        title: key,
        icon: {
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
        },
        zIndex: 100
    });

    markers.push(marker);
    console.log(pointxs[0]);
};
naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

function showMarker(map, marker) {

    if (marker.getMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.getMap()) return;
    marker.setMap(null);
}
var locationBtnHtml2 = '<div style="width: 400px; height: 50px; padding-left:30px;"><a data-animation="ripple" style="margin-left:5px;margin-top:10px;" align="center"><img src="images/searchicon.png" style="width:20px; height:20px; padding-bottom:5px;"></a><input onkeyup="enterkey(this.value);" id="11" type="text"style="display: inline; width: 70%; border-radius: 5em; border:1px solid gray;height: 100%; padding-left: 60px;"placeholder="YUMEET 맛집 검색"></div>';


naver.maps.Event.once(map, 'init_stylemap', function() {
    var customControl2 = new naver.maps.CustomControl(locationBtnHtml2, {
        position: naver.maps.Position.TOP_LEFT
    });
    customControl2.setMap(map);
	naver.maps.Event.addDOMListener(customControl2.getElement(),'click', function(){
		
	});
});
</script>
</body>
</html>