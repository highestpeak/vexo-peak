<form method="get" action="/search">
    <div class="hidden search-box" id="searchBox">
        <div class="search-ipt ipt">
            <div class="ipt-ct search-container" id="searchInput">
                <#--  search icon  -->
                <a class="icon-search input-icon" style="border-right: dashed gray 2px;" 
                    onclick="toggleSearchBox()">
                    <i class="fa fa-search" ></i>
                </a>

                <#--  input box  -->
                <label class="sh-lab">
                    <input class="sh-ipt" name="keyword" id="searchBoxInput" 
                        spellcheck="false" 
                        placeholder="Search" 
                        autofocus="autofocus" 
                        autocomplete="off">
                </label>

                <#--  close icon  -->
                <a class="icon-times input-icon close-input-icon" onclick="toggleSearchBox()">
                    <i class="fa fa-times" ></i>
                </a>
            </div>
        </div>
    </div>
</form>
<style>
.hidden {
    display: none;
}
.search-box {
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    z-index: 200;
    overflow-y: auto;
    height: 100%;
    background-color: rgba(0,0,0,.2);
}
.search-box .search-ipt {
    margin: 6rem auto 2rem;
    max-width: 660px;
    -webkit-animation: .2s both;
    animation: .2s both;
    -webkit-animation-name: searchShow;
    animation-name: searchShow;
}
@-webkit-keyframes searchShow {
    0% {
        transform: translate3d(0, -4rem, 0);
        opacity: 0
    }
    to {
        transform: translate3d(0, 4rem, 0);
        opacity: 1
    }
}

@keyframes searchShow {
    0% {
        transform: translate3d(0, -4rem, 0);
        opacity: 0
    }
    to {
        transform: translate3d(0, 4rem, 0);
        opacity: 1
    }
}
.ipt {
    border-color: #e0e0e0;
}
.ipt-ct {
    display: flex;
    white-space: nowrap;
    border-radius: 35px;
    height: 50px;
    background: #fff;
}
.sh-lab {
    display: flex;
    flex-direction: row-reverse;
    flex-grow: 1;
}
.sh-ipt {
    flex-grow: 1;
    font-size: 1.2rem;
    border: 0;
    line-height: 1.4;
}
input, textarea {
    border: 1px solid;
    color: inherit;
    font-family: inherit;
    padding: 4px 6px;
    background: 0 0;
}
input {
    -webkit-tap-highlight-color: rgba(255,0,0,0);
}
.input-icon {
    opacity: .7;
    transition: opacity .15s;
    color: #393939;
    padding: 0.5rem;
    font-size: 1.5rem;
}
.close-input-icon:hover{
    opacity: 1;
}
</style>