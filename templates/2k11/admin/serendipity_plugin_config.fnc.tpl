{* serendipity_plugins_admin.inc.php::serendipity_plugin_config() *}
    <script>
        var const_view = '{$CONST.VIEW_FULL}';
        var const_hide = '{$CONST.HIDE}';
        var img_plus   = '{serendipity_getFile file="img/plus.png"}';
        var img_minus  = '{serendipity_getFile file="img/minus.png"}';
    </script>
{if $showSubmit_head}
    <div class="save_conf form_buttons">
        {if $postKey == "template"}
            <a class="button_link" href="?serendipity[adminModule]=templates">{$CONST.BACK}</a>
        {/if}
        <input name="SAVECONF" type="submit" value="{$CONST.SAVE}">
    </div>
{/if}
{if $showTable}
    <div id="serendipity_plugin_config" class="configuration_group">
{/if}
{if is_array($config_groups)}
        <a id="optionall" class="button_link icon_link standalone" href="#" onClick="showConfigAll({sizeof($config_groups)}); return false" title="{$CONST.TOGGLE_ALL}">{$CONST.TOGGLE_ALL}</a>
    {foreach $config_groups AS $config_header => $config_groupkeys}
        <h2><a id="optionel{$config_groupkeys@iteration}" href="#" onClick="showConfig('el{$config_groupkeys@iteration}'); return false" title="{$CONST.TOGGLE_OPTION}">{$config_header}</a></h2>
        
        <fieldset id="el{$config_groupkeys@iteration}" class="plugin_optiongroup{if $config_groupkeys@last} plugin_optiongroup_last{/if}">
        {foreach $config_groupkeys AS $config_groupkey}
            {$OUT_STACK[$config_groupkey]}
        {/foreach}
        </fieldset>
        
        <script>document.getElementById('el{$config_groupkeys@iteration}').style.display = "none";</script>
    {/foreach}
{/if} {* foreach config_groups end *}

{foreach $OUT_STACK_REST as $out_stack_config_item}
    {$out_stack_config_item}
{/foreach}

{if $showTable}
    </div>
{/if}
{* $serendipity_printConfigJS *}{* outsourced to templates/default/admin/admin_scripts.js - see passed vars on top *}
{if $showSubmit_foot}
    <div class="save_conf form_buttons">
        {if $postKey == "template"}
            <a class="button_link" href="?serendipity[adminModule]=templates">{$CONST.BACK}</a>
        {/if}
        <input name="SAVECONF" type="submit" value="{$CONST.SAVE}">
    </div>
{/if}
{if $showExample}
    <div>{$plugin_example}</div>
{/if}
{if $spawnNuggets}
    {serendipity_hookPlugin hook="backend_wysiwyg_nuggets" eventData=$ev hookAll=true}
    {if ($ev['skip_nuggets'] === false)}
    <script>
    function Spawnnugget() { 
        {foreach $htmlnugget AS $htmlnuggetid}
        Spawnnuggets('{$htmlnuggetid}');
        {/foreach}
    } 
    </script>
    {/if}
{/if}