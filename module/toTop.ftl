<#-- reference from https://baozi.fun/ -->

<div class="moon-menu" id="moon-menu">
    <#--  点击悬浮百分比按钮后的弹出按钮  -->
    <div class="moon-menu-items item-ani active">
        <div class="moon-menu-item" onclick="ckBack2Top()" style="opacity: 0;"> 
            <img src="${theme_base!}/source/images/up.png">
        </div>
        <div class="moon-menu-item" onclick="ckBack2Bottom()" style="opacity: 0;"> 
            <img src="${theme_base!}/source/images/down.png">
        </div>
        <div class="moon-menu-item" onclick="toggleSearchBox()" style="opacity: 0;">
            <img src="${theme_base!}/source/images/search.png">
        </div>
    </div>

    <#--  悬浮百分比按钮  -->
    <div class="moon-menu-button" onclick="ckMoonButton()">
        <svg class="moon-menu-bg">
            <circle class="moon-menu-cricle" cx="50%" cy="50%" r="44%"></circle>
            <circle class="moon-menu-border" cx="50%" cy="50%" r="48%" style="stroke-dasharray: 0, 196;"></circle>
            <g class="moon-dot" style="">
                <circle r=".2rem" cx="0" cy="-.8rem"></circle>
                <circle r=".2rem"></circle>
                <circle r=".2rem" cx="0" cy=".8rem"></circle>
            </g>
        </svg>
        <div class="moon-menu-content">
            <div class="moon-menu-icon" style="display: block;"></div>
            <div class="moon-menu-text" style="display: none;">1%</div>
        </div>
    </div>
</svg>
<div>


<style>
/* 三个元素的容器 */
.moon-menu{
    position: fixed;
    right: 20px;
    bottom: 20px;
    width: 4em;
    height: 4em;
    z-index: 999;
    --moon-cricle: #607d8b;
    --color: #fff;
    --moon-item-bg-color: #000;
}

/* 三个元素定位 */
.item-ani div:first-child {
    transform: translate3d(0,-140%,0);
}
.item-ani div:nth-child(2) {
    transform: translate3d(-100%,-95%,0);
}
.item-ani div:nth-child(3) {
    transform: translate3d(-140%,0,0);
}
.moon-menu-items div:nth-child(3n-2) {
    top: 0;
    right: 0;
}
.moon-menu-items div:nth-child(3n-1) {
    top: 0;
    left: 0;
}
.moon-menu-items div:nth-child(3n) {
    bottom: 0;
    left: 0;
}

/* 三个元素样式 */
.moon-menu-item {
    position: absolute;
    z-index: -1;
    width: 2.8rem;
    height: 2.8rem;
    border-radius: 50%;
    background-color: rgba(0,0,0,.8);
    box-shadow: 0 2px 4px 1px rgba(0,0,0,.2);
    font-size: 1.5rem;
    opacity: 0;
    cursor: pointer;
    transition: .4s cubic-bezier(0,0,.382,1.618);
    transition-property: transform,opacity;
}
.moon-menu-item img{
    width:24.8px !important;
    height:24.8px !important;
    margin-left: 0.6rem;
    margin-top: 0.6rem;
}

/* 回到顶部按钮 */
.moon-menu-button {
    width: 4em;
    height: 4em;
    cursor: pointer;
}
.moon-menu, .moon-menu-bg, .moon-menu-content {
    position: fixed;
    right: 20px;
    bottom: 20px;
    width: 4em;
    height: 4em;
    z-index: 999;
}
.moon-menu-cricle {
    fill: var(--moon-cricle,#607d8b);
    opacity: .9;
}
.moon-menu-border {
    stroke: var(--moon-cricle,#607d8b);
    opacity: .9;
    stroke-width: 1px;
    fill: none;
    transform: rotate(-90deg);
    transform-origin: 50% 50%;
}
.moon-dot {
    transform: translate3d(2rem,2rem,0);
}
.moon-dot circle {
    transition: all .15s cubic-bezier(0,0,.382,1.618);
    fill: #fff;
}
.moon-menu-icon {
    font-size: 2.5em;
    line-height: 1.6em;
    color: var(--color,#fff);
    text-align: center;
}
.moon-menu-text {
    color: var(--color,#fff);
    font-weight: 400;
    text-align: center;
    line-height: 3.5em;
    font-size: 1.2em;
    display: none;
}

</style>

<script>
    // 改变百分比
    const moonMenuListener = function() {
        // Get scroll percent
        const offsetHeight = document.documentElement.offsetHeight;
        const clientHeight = document.documentElement.clientHeight;
        const scrollTop = document.documentElement.scrollTop;
        let percent = Math.round(scrollTop / (offsetHeight-clientHeight) * 100);
        if (percent > 100) percent = 100;

        const menuIcon = document.querySelector('.moon-menu-icon');
        const menuText = document.querySelector('.moon-menu-text');
        if (!percent) {
            percent = 0;
            menuIcon.style.display = 'block';
            menuText.style.display = 'none';
            document.querySelector('.moon-dot').style.opacity = .9;
        } else {
            menuIcon.style.display = 'none';
            menuText.style.display = 'block';
            menuText.innerHTML = percent + '%';
            document.querySelector('.moon-dot').style.opacity = 0;
        }

        // Update strokeDasharray
        const length = 196;
        document.querySelector('.moon-menu-border').style.strokeDasharray = percent * length / 100 + ' ' + length;
    };

    window.addEventListener('load', () => {
        moonMenuListener();
    });
    window.addEventListener('scroll', moonMenuListener);

    // 设置弹出按钮的透明度
    document.querySelector('.moon-menu-button').addEventListener('click', () => {
        document.querySelector('.moon-menu-icon').classList.toggle('active');
        const items = document.querySelector('.moon-menu-items');
        items.classList.toggle('active');
        const childItems = document.querySelectorAll('.moon-menu-item');
        if (items.classList.contains('active')) {
            for (let i = 0; i < childItems.length; i++) {
                // childItems[i].style.top = -3 - 3 * i + 'em';
                childItems[i].style.opacity = 0;
            }
        } else {
            for (let i = 0; i < childItems.length; i++) {
                // childItems[i].style.top = '1em';
                childItems[i].style.opacity = .9;
            }
        }
    });

    function ckBack2Top() {
        window.scroll({top: 0, behavior: 'smooth'});
    }

    function ckBack2Bottom() {
        const scrollHeight = document.documentElement.scrollHeight;
        const clientHeight = document.documentElement.clientHeight;
        window.scroll({top: scrollHeight - clientHeight, behavior: 'smooth'});
    }

    function toggleSearchBox() {
        // todo: 搜索功能 参考的是 https://baozi.fun/
        document.querySelector('#searchBox').toggleClass('hidden');
    }

    function toggleCircle() {
        var moonDot = document.querySelector('.moon-dot');
        var cirList = moonDot.querySelectorAll("circle");
        var firstCircle = cirList[0];
        var lastCircle = cirList[cirList.length-1];
        var cy = firstCircle.attributes["cy"];
        if (cy.value === '0') {
            firstCircle.setAttribute("cx",'0');
            firstCircle.setAttribute("cy",'-.8rem');
            lastCircle.setAttribute("cx",'0');
            lastCircle.setAttribute("cy",'.8rem');
        } else {
            firstCircle.setAttribute("cx",'-.8rem');
            firstCircle.setAttribute("cy",'0');
            lastCircle.setAttribute("cx",'.8rem');
            lastCircle.setAttribute("cy",'0');
        }
    }

    function ckMoonButton() {
        // 右下角的小点
        toggleCircle();
    }
</script>