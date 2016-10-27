{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
 ********************************************************************************/
-->*}
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$APP.LBL_CHARSET}">
	<title>{$USER} - {$MODULE_NAME|@getTranslatedString:$MODULE_NAME} - {$APP.LBL_BROWSER_TITLE}</title>
	<link REL="SHORTCUT ICON" HREF="{$FAVICON}">
	<style type="text/css">@import url("themes/{$THEME}/style.css?v={$VERSION}");</style>
	{if $PRELOAD_JSCALENDAR neq 'false'}<link rel="stylesheet" type="text/css" media="all" href="jscalendar/calendar-win2k-cold-1.css">{/if}
	<link rel="stylesheet" href="include/print.css" type="text/css" media="print" />
{* vtlib customization: Inclusion of custom javascript and css as registered *}
{if $HEADERCSS}
	<!-- Custom Header CSS -->
	{foreach item=HDRCSS from=$HEADERCSS}
	<link rel="stylesheet" type="text/css" href="{$HDRCSS->linkurl}" />
	{/foreach}
	<!-- END -->
{/if}
{* END *}
	<!-- ActivityReminder customization for callback -->
{literal}
	<style type="text/css">div.fixedLay1 { position:fixed; }</style>
	<!--[if lte IE 6]>
	<style type="text/css">div.fixedLay { position:absolute; }</style>
	<![endif]-->
	<style type="text/css">div.drop_mnu_user { position:fixed; }</style>
	<!--[if lte IE 6]>
	<style type="text/css">div.drop_mnu_user { position:absolute; }</style>
	<![endif]-->
{/literal}
	<!-- End -->
</head>
{include file='BrowserVariables.tpl'}
<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small>
	<a name="top"></a>
	<!-- header -->
	<!-- header-vtiger crm name & RSS -->
	<script type="text/javascript" src="include/jquery/jquery.js"></script>
	<script type="text/javascript" src="include/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="include/js/meld.js"></script>
	<script type="text/javascript" src="include/js/json.js"></script>
	<script type="text/javascript" src="include/js/general.js?v={$VERSION}"></script>
	<!-- vtlib customization: Javascript hook -->
	<script type="text/javascript" src="include/js/vtlib.js?v={$VERSION}"></script>
	<!-- END -->
	<script type="text/javascript" id="_current_language_" src="include/js/{$LANGUAGE}.lang.js?{$VERSION}"></script>
	<script type="text/javascript" src="include/js/QuickCreate.js"></script>
	<script type="text/javascript" src="include/js/menu.js?v={$VERSION}"></script>
	{if $CALCULATOR_DISPLAY eq 'true'}
	<script type="text/javascript" src="include/calculator/calc.js"></script>
	{/if}
	<script type="text/javascript" src="modules/Calendar/script.js"></script>
	<script type="text/javascript" src="include/js/notificationPopup.js"></script>
	{if $PRELOAD_JSCALENDAR neq 'false'}
	<script type="text/javascript" src="jscalendar/calendar.js"></script>
	<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
	<script type="text/javascript" src="jscalendar/lang/calendar-{$APP.LBL_JSCALENDAR_LANG}.js"></script>
	{/if}
    <!-- asterisk Integration -->
{if $USE_ASTERISK eq 'true'}
	<script type="text/javascript" src="include/js/asterisk.js"></script>
	<script type="text/javascript">
	if(typeof(use_asterisk) == 'undefined') use_asterisk = true;
	</script>
{/if}
    <!-- END -->

{* vtlib customization: Inclusion of custom javascript and css as registered *}
{if $HEADERSCRIPTS}
	<!-- Custom Header Script -->
	{foreach item=HEADERSCRIPT from=$HEADERSCRIPTS}
	<script type="text/javascript" src="{$HEADERSCRIPT->linkurl}"></script>
	{/foreach}
	<!-- END -->
{/if}
{* END *}

	{* PREFECTHING IMAGE FOR BLOCKING SCREEN USING VtigerJS_DialogBox API *}
    <img src="{'layerPopupBg.gif'|@vtiger_imageurl:$THEME}" style="display: none;"/>
    {* END *}

<TABLE border=0 cellspacing=0 cellpadding=0 width=100% class="small">
	<tr>
		<td valign=top align=left><img src="test/logo/{$FRONTLOGO}" alt="{$COMPANY_DETAILS.name}" title="{$COMPANY_DETAILS.name}" border=0 style="width: 15em;height: 4.2em;"></td>
		<td align="center" valign=bottom  >
			<div align ="center" width ="50%" border='3' style="padding:5px;" class="noprint">
				<table border=0 cellspacing=0 cellpadding=0 id="search" align="center">
			   		<tr>
					<form name="UnifiedSearch" method="post" action="index.php" style="margin:0px" onsubmit="VtigerJS_DialogBox.block();">
						<td style="background-color:#ffffef;border:1px;border-color:black;vertical-align:middle;" nowrap>
							<input type="hidden" name="action" value="UnifiedSearch" style="margin:0px">
							<input type="hidden" name="module" value="Home" style="margin:0px">
							<input type="hidden" name="parenttab" value="{$CATEGORY}" style="margin:0px">
							<input type="hidden" name="search_onlyin" value="--USESELECTED--" style="margin:0px">
							<input type="text" name="query_string" value="{$QUERY_STRING}" class="searchBox" onFocus="this.value=''" >
						</td>
                        <td align ="right" style="background-color:#FFFFEF; vertical-align:middle;padding:5px;" onclick="UnifiedSearch_SelectModuleForm(this);">
                                <a href='javascript:void(0);' ><img src="{'arrow_down_black.png'|@vtiger_imageurl:$THEME}" align='left' border=0></a>
                        </td>
						<td style="background-color:#cccccc">
							<input type="image" class="searchBtn"  alt="{$APP.LBL_FIND}" title="{$APP.LBL_FIND}" width = "70%;" height="70%" src="{'searchicon.PNG'|@vtiger_imageurl:$THEME}" align='left' border=1>
						</td>
					</form>
		   			</tr>
				</table>
			</div>
		</td>
		<td class=small nowrap align="right" style="padding-right:10px;">
			<table border=0 cellspacing=0 cellpadding=0>
			<tr>
				<td valign="top" class="genHeaderSmall" style="padding-left:10px;padding-top:3px;">
					<span class="userName">{$USER}</span>
				</td>
				<td class="small" valign="bottom" nowrap style="padding-bottom: 1em;"><a href="index.php?module=Users&action=DetailView&record={$CURRENT_USER_ID}&modechk=prefview"><img src="{$IMAGEPATH}user.PNG" border=0 style="padding: 0px;padding-left:5px" title="{$APP.LBL_MY_PREFERENCES}" alt="{$APP.LBL_MY_PREFERENCES}"></a></td>
				{* vtlib customization: Header links on the top panel *}
				{if $HEADERLINKS}
			<td style="padding-bottom:1em;padding-left:10px;padding-right:5px" class=small nowrap valign="bottom">
				<a href="javascript:;" onmouseover="fnvshobj(this,'vtlib_headerLinksLay');" onclick="fnvshobj(this,'vtlib_headerLinksLay');"><img src="{'menu_more.png'|@vtiger_imageurl:$THEME}" border=0 style="padding: 0px;padding-left:5px"></a>
					<div style="display: none; left: 193px; top: 106px;width:155px; position:absolute;" id="vtlib_headerLinksLay"
					onmouseout="fninvsh('vtlib_headerLinksLay')" onmouseover="fnvshNrm('vtlib_headerLinksLay')">
					<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td style="border-bottom: 1px solid rgb(204, 204, 204); padding: 5px;"><b>{$APP.LBL_MORE}</b></td>
					</tr>
					<tr>
						<td>
						{foreach item=HEADERLINK from=$HEADERLINKS}
						{assign var="headerlink_href" value=$HEADERLINK->linkurl}
						{assign var="headerlink_label" value=$HEADERLINK->linklabel}
						{if $headerlink_label eq ''}
							{assign var="headerlink_label" value=$headerlink_href}
						{else}
						{* Pickup the translated label provided by the module *}
							{assign var="headerlink_label" value=$headerlink_label|@getTranslatedString:$HEADERLINK->module()}
						{/if}
						<a href="{$headerlink_href}" class="drop_down">{$headerlink_label}</a>
						{/foreach}
						</td>
					</tr>
					</table>
					</div>
				</td>
				{/if}
				{if $HELP_URL}
				<td valign="bottom" nowrap style="padding-bottom: 1em;" class="small" nowrap><a href="{$HELP_URL}" target="_blank"><img src="{$IMAGEPATH}info.PNG" border=0 style="padding: 0px;padding-left:5px" title="{$APP.LNK_HELP}"></a></td>
				{/if}
				{if $ADMIN_LINK neq ''}
					{foreach key=maintabs item=detail from=$HEADERS}
						{if $maintabs eq "Settings"}
							<td  valign="bottom" nowrap style="padding-bottom: 1em;" class="small" onmouseout="fnHideDrop('mainsettings');" onmouseover="fnDropDown(this,'mainsettings');" nowrap><a href="index.php?module=Settings&action=index&parenttab=" id="settingslink"><img src="{$IMAGEPATH}mainSettings.PNG" border=0 style="padding: 0px;padding-left:5px"></a></td>
						{/if}
					{/foreach}
				{/if}
				<td  valign="bottom" nowrap style="padding-bottom: 1em;" class="small" nowrap><a href="index.php?module=Users&action=Logout"> <img src="themes/images/logout.png" border=0 style="padding: 0px;padding-left:5px " title="{$APP.LBL_LOGOUT}" alt="{$APP.LBL_LOGOUT}"></a></td>
			</tr>
			</table>
        </td>
	</tr>
</TABLE>
{if $ANNOUNCEMENT}
	<table width ="100%">
	<tr  colspan="3" width="100%">
		<td width="90%" align=center>
			{if $APP.$MODULE_NAME eq 'Dashboards'}
				<marquee id="rss" direction="left" scrolldelay="10" scrollamount="3" behavior="scroll" class="marStyle" onMouseOver="javascript:stop();" onMouseOut="javascript:start();">&nbsp;{$ANNOUNCEMENT|escape}</marquee>
			{else}
				<marquee id="rss" direction="left" scrolldelay="10" scrollamount="3" behavior="scroll" class="marStyle" onMouseOver="javascript:stop();" onMouseOut="javascript:start();">&nbsp;{$ANNOUNCEMENT}</marquee>
			{/if}
		</td>
		<td width="10%" align="right" style="padding-right:38px;"><img src="{'Announce.PNG'|@vtiger_imageurl:$THEME}"></td>
	</tr>
	</table>
{/if}

<div id='miniCal' style='width:300px; position:absolute; display:none; left:100px; top:100px; z-index:100000'></div>

{if $MODULE_NAME eq 'Calendar'}
	<div id="CalExport" style="width:300px; position:absolute; display:none; left:500px; top:100px; z-index:100000" class="layerPopup">
		<table border=0 cellspacing=0 cellpadding=5 width=100% class=layerHeadingULine>
		<tr>
			<td class="genHeaderSmall" nowrap align="left" width="30%" >{$APP.LBL_EXPORT} </td>
			<td align="right"><a href='javascript:ghide("CalExport");'><img src="{'close.gif'|@vtiger_imageurl:$THEME}" align="right" border="0"></a></td>
		</tr>
		</table>
		<table border=0 cellspacing=0 cellpadding=5 width=95% align=center>
		<tr>
			<td class="small">
				<table border=0 celspacing=0 cellpadding=5 width=100% align=center bgcolor=white>
				<tr>
					<td align="right" nowrap class="cellLabel small">
						<input class="small" type='radio' name='exportCalendar' value = 'iCal' onclick="jQuery('#ics_filename').removeAttr('disabled');" checked /> iCal Format
					</td>
					<td align="left">
						<input class="small" type='text' name='ics_filename' id='ics_filename' size='25' value='export.calendar'/>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		<table border=0 cellspacing=0 cellpadding=5 width=100% class="layerPopupTransport">
		<tr>
			<td class="small" align="center">
				<input type="button" onclick="return exportCalendar();" value="Export" class="crmbutton small edit" name="button"/>
			</td>
		</tr>
		</table>
	</div>
	<div id='CalImport' style='position:absolute; display:none; left:500px; top:100px; z-index:100000' class="layerPopup">
		{assign var='label_filename' value='LBL_FILENAME'}
		<form name='ical_import' id='ical_import' onsubmit="VtigerJS_DialogBox.block();" enctype="multipart/form-data" action="index.php" method="POST">
		<input type='hidden' name='module' value=''>
		<input type='hidden' name='action' value=''>
		<table border=0 cellspacing=0 cellpadding=5 width=100% class=layerHeadingULine>
		<tr>
			<td class="genHeaderSmall" nowrap align="left" width="30%" id="editfolder_info">{$APP.LBL_IMPORT}</td>
			<td align="right"><a href='javascript:ghide("CalImport");'><img src="{'close.gif'|@vtiger_imageurl:$THEME}" align="absmiddle" border="0"></a></td>
		</tr>
		</table>
		<table border=0 cellspacing=0 cellpadding=5 width=95% align=center>
		<tr>
			<td class="small">
				<table border=0 celspacing=0 cellpadding=5 width=100% align=center bgcolor=white>
				<tr>
					<td align="right" nowrap class="cellLabel small"><b>{$label_filename|@getTranslatedString} </b></td>
					<td align="left">
						<input class="small" type='file' name='ics_file' id='ics_file'/>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		<table border=0 cellspacing=0 cellpadding=5 width=100% class="layerPopupTransport">
		<tr>
			<td class="small" align="center">
				<input type="button" onclick="return importCalendar();" value="Import" class="crmbutton small edit" name="button"/>
			</td>
		</tr>
		</table>
	</form>
	</div>
{/if}
{$COREBOS_HEADER_PREMENU}
<!-- header - master tabs -->
<TABLE border=0 cellspacing=0 cellpadding=0 width=100% class="hdrTabBg">
<tr>
	{if $MODULE_NAME eq 'Home'}
		<td style="width:50px" class='tabSelected' align = "center"><a href= "index.php?module=Home&action=index"><img src="{$IMAGEPATH}Home.PNG" style="width:16px;height:16px;" border="0" /></a></td>
	{else}
		<td style="width:50px" class='tabUnSelected' align = "center"><a href= "index.php?module=Home&action=index&parenttab=My Home Page"><img src="{$IMAGEPATH}Home.PNG" style="width:16px;height:16px;" border="0" /></a></td>
	{/if}
	<td class=small nowrap>
		<table border=0 cellspacing=0 cellpadding=0>
		<tr>
			<td class=tabSeperator ><img src="{'spacer.gif'|@vtiger_imageurl:$THEME}" width=2px height=28px align="right"></td>
				{assign var="count" value=1}
                {foreach key=maintabs item=detail from=$MENUSTRUCTURE}
					{if $maintabs eq 'top'}
                    {foreach key=number item = name from = $detail}
						{assign var="modulename" value=$name[1]|@getTranslatedString:$name[0]}
                        {assign var="modulelabel" value=$name[0]}
                        {if $modulelabel ne $MODULE_NAME}
							<td class="tabUnSelected"  align="center" nowrap><a href="index.php?module={$name[0]}&action=index">{$modulename}</a></td>
                            <td class="tabSeperator"><img src="{'spacer.gif'|@vtiger_imageurl:$THEME}"></td>
						{else}
							<td class="tabSelected"  align="center" nowrap><a href="index.php?module={$name[0]}&action=index">{$modulename}</a></td>
                            <td class="tabSeperator"><img src="{'spacer.gif'|@vtiger_imageurl:$THEME}"></td>
						{/if}
					{/foreach}
					{/if}
				{/foreach}
				{foreach key=maintabs item=detail from=$MENUSTRUCTURE}
					{if $maintabs eq 'more' && $detail != null}
						<td class="tabUnSelected"  align="center" onmouseout="fnHide_Event('allMenu');" onmouseover="fnvshobjMore(this,'allMenu');"nowrap><a href="javascript:;" >{$APP.LBL_MORE}<img src="{'menuDnArrow.gif'|@vtiger_imageurl:$THEME}" border=0 style="padding-left:5px" /></a></td>
						<td class="tabSeperator"><img src="{'spacer.gif'|@vtiger_imageurl:$THEME}"></td>
					{/if}
				{/foreach}
				<td style="padding-left:10px" nowrap>
				{if $CNT eq 1}
					<select class=small id="qccombo" style="width:110px"  onclick="QCreate(this);">
						<option value="none">{$APP.LBL_QUICK_CREATE}...</option>
							{foreach  item=detail from=$QCMODULE}
								<option value="{$detail.1}">{$APP.NEW}&nbsp;{$detail.0}</option>
							{/foreach}
					</select>
				{else}
					<select class=small id="qccombo" style="width:110px"  onchange="QCreate(this);">
						<option value="none">{$APP.LBL_QUICK_CREATE}...</option>
						{foreach  item=detail from=$QCMODULE}
							<option value="{$detail.1}">{$APP.NEW}&nbsp;{$detail.0}</option>
						{/foreach}
					</select>
				{/if}
				</td>
			</tr>
			</table>
		</td>
		<td align=right style="padding-right:10px" nowrap >
		</td>
	</tr>
	</TABLE>


<div id="calculator_cont" style="position:absolute; z-index:10000" ></div>
	{include file="Clock.tpl"}

<div id="qcform" style="position:absolute;width:700px;top:80px;left:450px;z-index:90000;"></div>

<!-- Unified Search module selection feature -->
<div id="UnifiedSearch_moduleformwrapper" style="position:absolute;width:417px;z-index:100002;display:none;"></div>
<script type='text/javascript'>
{literal}
function UnifiedSearch_SelectModuleForm(obj) {
	if(jQuery('#UnifiedSearch_moduleform').length) {
		// If we have loaded the form already.
		UnifiedSearch_SelectModuleFormCallback(obj);
	} else {
		jQuery('#status').show();
		jQuery.ajax({
				method:"POST",
				url:'index.php?module=Home&action=HomeAjax&file=UnifiedSearchModules&ajax=true'
		}).done(function(response) {
				jQuery('#status').hide();
				jQuery('#UnifiedSearch_moduleformwrapper').html(response);
				UnifiedSearch_SelectModuleFormCallback(obj);
		});
	}
}
function UnifiedSearch_SelectModuleFormCallback(obj) {
	fnvshobjsearch(obj, 'UnifiedSearch_moduleformwrapper');
}
function UnifiedSearch_SelectModuleToggle(flag) {
	jQuery('#UnifiedSearch_moduleform input[type=checkbox]').each(function() {
			this.checked = flag;
			}
	);
}
function UnifiedSearch_SelectModuleCancel() {
	jQuery('#UnifiedSearch_moduleformwrapper').hide();
}
function UnifiedSearch_SelectModuleSave() {
	var UnifiedSearch_form = document.forms.UnifiedSearch;
	UnifiedSearch_form.search_onlyin.value = jQuery('#UnifiedSearch_moduleform').serialize().replace(/search_onlyin=/g, '').replace(/&/g,',');
	jQuery.ajax({
			method:"POST",
			url:'index.php?module=Home&action=HomeAjax&file=UnifiedSearchModulesSave&search_onlyin=' + encodeURIComponent(UnifiedSearch_form.search_onlyin.value)
	}).done(function(response) {
				// continue
		}
	);
	UnifiedSearch_SelectModuleCancel();
}
{/literal}
</script>
<!-- End -->

<script>
function fetch_clock()
{ldelim}
	jQuery.ajax({ldelim}
			method:"POST",
			url:'index.php?module=Utilities&action=UtilitiesAjax&file=Clock'
	{rdelim}).done(function(response) {ldelim}
				jQuery("#clock_cont").html(response);
				execJS(jQuery('#clock_cont'));
	{rdelim}
	);
{rdelim}

function fetch_calc()
{ldelim}
	jQuery.ajax({ldelim}
			method:"POST",
			url:'index.php?module=Utilities&action=UtilitiesAjax&file=Calculator'
	{rdelim}).done(function(response) {ldelim}
				jQuery("#calculator_cont").html(response);
				execJS(jQuery('#calculator_cont'));
		{rdelim}
	);
{rdelim}
</script>

<script type="text/javascript">
{literal}
function QCreate(qcoptions){
	var module = qcoptions.options[qcoptions.options.selectedIndex].value;
	if(module != 'none'){
		document.getElementById("status").style.display="inline";
		if(module == 'Events'){
			module = 'Calendar';
			var urlstr = '&activity_mode=Events';
		}else if(module == 'Calendar'){
			module = 'Calendar';
			var urlstr = '&activity_mode=Task';
		}else{
			var urlstr = '';
		}
		jQuery.ajax({
				method:"POST",
				url:'index.php?module='+module+'&action='+module+'Ajax&file=QuickCreate'+urlstr
		}).done(function(response) {
					document.getElementById("status").style.display="none";
					document.getElementById("qcform").style.display="inline";
					document.getElementById("qcform").innerHTML = response;
					jQuery("#qcform").draggable();
					// Evaluate all the script tags in the response text.
					var scriptTags = document.getElementById("qcform").getElementsByTagName("script");
					for(var i = 0; i< scriptTags.length; i++){
						var scriptTag = scriptTags[i];
						eval(scriptTag.innerHTML);
					}
					posLay(qcoptions, "qcform");
			}
		);
	}else{
		hide('qcform');
	}
}
</script>
{/literal}

{* More menu items *}
<div id="allMenu" onmouseout="fnHide_Event('allMenu');" onMouseOver="fnvshNrm('allMenu');" style="z-index: 2147483647;visibility:hidden;display:block;overflow-x:auto;">
	<table border=0 cellpadding="0" cellspacing="0" class="allMnuTable" padding="0" style="width:20px;">
	<tr>
                {foreach name=modulelist key=more item=childmodules from=$MENUSTRUCTURE}
                    {if $more eq 'more'}
                        {foreach key = parent item = childs from = $childmodules}
                            <td valign="top"><table stye="width:20px;">
                            <tr><th><a class="drop_downnew_parent"> {$APP[$parent]}</a></th></tr>
                            {foreach key = number item = modules from = $childs}
        			{assign var="modulelabel" value=$modules[1]|@getTranslatedString:$modules[0]}
        			<tr><td><a id = "more" name = "{$modulelabel}"  href="index.php?module={$modules.0}&action=index"  class="drop_downnew">{$modulelabel}</a></td></tr>
                            {/foreach}
                            </table></td>
                        {/foreach}
                   {/if}
        	{/foreach}
	</tr>
        </table>
</div>

<div id="status" style="position:absolute;display:none;left:850px;top:95px;height:27px;white-space:nowrap;"><img src="{'status.gif'|@vtiger_imageurl:$THEME}"></div>

<div id="tracker" style="display:none;position:absolute;z-index:100000001;" class="layerPopup">

	<table border="0" cellpadding="5" cellspacing="0" width="200">
	<tr style="cursor:move;">
		<td colspan="2" class="mailClientBg small" id="Track_Handle"><strong>{$APP.LBL_LAST_VIEWED}</strong></td>
		<td align="right" style="padding:5px;" class="mailClientBg small">
		<a href="javascript:;"><img src="{'close.gif'|@vtiger_imageurl:$THEME}" border="0"  onClick="fninvsh('tracker')" hspace="5" align="absmiddle"></a>
		</td></tr>
	</table>
	<table border="0" cellpadding="5" cellspacing="0" width="200" class="hdrNameBg">
	{foreach name=trackinfo item=trackelements from=$TRACINFO}
	<tr>
		<td class="trackerListBullet small" align="center" width="12">{$smarty.foreach.trackinfo.iteration}</td>
		<td class="trackerList small"> <a href="index.php?module={$trackelements.module_name}&action=DetailView&record={$trackelements.crmid}&parenttab={$CATEGORY}">{$trackelements.item_summary}</a> </td><td class="trackerList small">&nbsp;</td></tr>
	{/foreach}
	</table>
</div>

<script>
	jQuery('#tracker').draggable({ldelim} handle: "#Track_Handle" {rdelim});
</script>

<!--for admin users-->
<div class="drop_mnu_user" id="ondemand_sub" onmouseout="fnHideDrop('ondemand_sub')" onmouseover="fnShowDrop('ondemand_sub')" >
	<table border="0" cellpadding="0" cellspacing="0" border="0" cellpadding="0" cellspacing="0">
		<tr><td style="padding-left:0px;padding-right:10px font-weight:bold"  nowrap> <a id="_my_preferences_" href="index.php?module=Users&action=DetailView&record={$CURRENT_USER_ID}&modechk=prefview" class="drop_down_usersettings" >{$APP.LBL_MY_PREFERENCES}</a></td></tr>
		<tr><td style="padding-left:0px;padding-right:10px font-weight:bold"  nowrap> <a href="index.php?module=Users&action=Logout" class="drop_down_usersettings" >{$APP.LBL_LOGOUT}</a> </td></tr>
	</table>
</div>
<div  id="mainsettings" class="drop_mnu_user" onmouseout="fnHideDrop('mainsettings');" onmouseover="fnvshNrm('mainsettings');" style="width:110px;left:1226px;" >
	<table border=0 width="100%" border="0" cellpadding="0" cellspacing="0" >
		{foreach key=maintabs item=detail from=$HEADERS}
			{if $maintabs eq "Settings"}
			<tr><td style="padding-left:0px;padding-right:10px font-weight:bold"  nowrap><a href="index.php?module={$detail[0]}&action=index&parenttab=" class="drop_down_usersettings">{$detail[0]|@getTranslatedString:$detail[0]}</a></td></tr>
			{/if}
		{/foreach}
		<tr><td style="padding-left:0px;padding-right:10px font-weight:bold"  nowrap><a href="index.php?module=Settings&action=index&parenttab=" class="drop_down_usersettings">{'LBL_CRM_SETTINGS'|@getTranslatedString:$MODULE_NAME}</a></td></tr>
	</table>
</div>

<!-- ActivityReminder Customization for callback -->
<div class="lvtCol fixedLay1" id="ActivityRemindercallback" style="border: 0; right: 0px; bottom: 2px; display:none; padding: 2px; z-index: 10; font-weight: normal;" align="left">
</div>
<!-- End -->

<!-- divs for asterisk integration -->
<div class="lvtCol fixedLay1" id="notificationDiv" style="float: right;  padding-right: 5px; overflow: hidden; border-style: solid; right: 0px; border-color: rgb(141, 141, 141); bottom: 0px; display: none; padding: 2px; z-index: 10; font-weight: normal;" align="left">
</div>

<div id="OutgoingCall" style="display: none;position: absolute;z-index:200;" class="layerPopup">
	<table  border='0' cellpadding='5' cellspacing='0' width='100%'>
		<tr style='cursor:move;' >
			<td class='mailClientBg small' id='outgoing_handle'>
				<b>{$APP.LBL_OUTGOING_CALL}</b>
			</td>
		</tr>
	</table>
	<table  border='0' cellpadding='0' cellspacing='0' width='100%' class='hdrNameBg'>
		</tr>
		<tr><td style='padding:10px;' colspan='2'>
			{$APP.LBL_OUTGOING_CALL_MESSAGE}
		</td></tr>
	</table>
</div>
<!-- divs for asterisk integration :: end-->
