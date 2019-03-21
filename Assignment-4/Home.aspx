<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
            <div class="slider">
                <ul class="slides">
                    <li>
                        <img src="sl1.jpg" />
                    </li>
                    <li>
                        <img src="sl2.jpg">
                    </li>
                    <li>
                        <img src="sl3.jpg">
                    </li>
                    <li>
                        <img src="sl4.jpg">
                    </li>
                </ul>
            </div>

        <div class="container">

            <div class="row">
                <div class="col l12 s12 m5">
                    <div class="card-panel teal hoverable">
                        <span class="white-text" style="font-size: x-large;">
                            The Soccer League is a youth organization in Ontario with boys and girls divisions for U12, U15, U18 as well as Adult Mens and Womens.
 
                                The following clubs are members of the Lakeshore Soccer League:</span>
                        
                        <div class="row">
                            <div class="col l6">
                                <ul class="white-text" id="staggered-test">
                                    <li class="divider"></li>
                                    <li>Blue Mountain<//li>
                                    <li>Chatsworth</li>
                                    <li>Chesley</li>
                                    <li>Hanover</li>
                                    <li>Kincardine</li>
                                    <li>Markdale</li>
                                 </ul>
                            </div>
                            <div class="col l6">
                                <ul class="white-text" id="staggered-test2">
                                    <li>Mildmay</li>
                                    <li>Mount Forest</li>
                                    <li>Ripley</li>
                                    <li>Saugeen Shores</li>
                                    <li>Tara</li>
                                    <li>Walkerton</li>
                                    <li>West Grey</li>
                                    <li class="divider"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>      

<script>
        $(document).ready(function () {
            $('.slider').slider();
        });
</script>
</asp:Content>