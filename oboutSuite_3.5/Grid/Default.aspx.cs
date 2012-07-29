using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Collections;
using System.Text;

public partial class Grid_Default : OboutInc.oboutAJAXPage
{
    protected Dictionary<string, int> mainCategories;

    protected void Page_Load(object sender, EventArgs e)
    {              
        CreateDictionaries();
        BuildCategoriesTree();
        //DisplayPathToExamples();        

        if(Session["GridSamples_CategoryName"] != null)
        {
            string type = "aspnet_";
            
            if (Session["GridSamples_Type"] != null)
            {
                type = Session["GridSamples_Type"].ToString();

                RbtnAspNet.Checked = type == "aspnet_";
                RbtnCSharp.Checked = type == "cs_";
                RbtnVbNet.Checked = type == "vb_";
            }
            
            ClientScript.RegisterStartupScript(typeof(Page), "LoadSamples", "loadInitialSamples('" + type + "', '" + Session["GridSamples_CategoryName"].ToString() + "')", true);
        }
    }

    protected void CreateDictionaries()
    {
        mainCategories = new Dictionary<string, int>();

        mainCategories.Add("Appearance", 1);
        mainCategories.Add("Populating with Data", 13);
        mainCategories.Add("Add/Edit/Delete", 26);
        mainCategories.Add("Record Selection", 13);
        mainCategories.Add("Columns", 23);
        mainCategories.Add("Paging", 8);
        mainCategories.Add("Sorting", 4);
        mainCategories.Add("Filtering", 25);
        mainCategories.Add("Templates", 35);
        mainCategories.Add("Scrolling", 17);
        mainCategories.Add("Grouping", 14);
        mainCategories.Add("Totals / Sub-Totals", 6);
        mainCategories.Add("Master / Detail", 37);
        mainCategories.Add("Column Sets", 4);
        mainCategories.Add("Exporting", 19);
        mainCategories.Add("Accessibility", 2);
        mainCategories.Add("Localization", 2);
        mainCategories.Add("Client-Side Events", 2);
        mainCategories.Add("Server-Side Events", 3);
        mainCategories.Add("Printing", 5);
        mainCategories.Add("Validation", 3);
        mainCategories.Add("Integration", 19);
        mainCategories.Add("ASP.NET AJAX", 7);
        mainCategories.Add("State Keeping", 3);
        mainCategories.Add("Other Features", 16);
        mainCategories.Add("Mode", 2);
        mainCategories.Add("Layout Customization", 4);
        mainCategories.Add("Rows", 3);
    }    

    protected void BuildCategoriesTree()
    {
        StringBuilder mainCategoriesText = new StringBuilder();
        foreach (KeyValuePair<string, int> category in mainCategories)
        {
            mainCategoriesText.Append("<a class=\"header\" href=\"javascript: loadSamples('" + category.Key + "');\">" + category.Key + "</a> - <span class=\"headerNumber\">" + category.Value.ToString() + "</span> <br /><br />");
        }
        MainCategories.Text = mainCategoriesText.ToString();
    }

    public string LoadSamples(string categoryName, string type)
    {
        Session["GridSamples_CategoryName"] = categoryName;
        Session["GridSamples_Type"] = type;
        
        List<Dictionary<string, string>> samples = new List<Dictionary<string, string>>();

        switch (categoryName)
        {
            case "Appearance":
                samples.Add(PrepareSample("Style Gallery", "style_gallery.aspx"));
                break;
            
            case "Populating with Data":
                samples.Add(PrepareSample("Declaratively (Design-time)"));
                samples.Add(PrepareSample("Binding to ObjectDataSource", "data_sources_ods.aspx"));
                samples.Add(PrepareSample("Binding to SqlDataSource", "data_sources_sds.aspx"));
                samples.Add(PrepareSample("Binding to XmlDataSource", "data_sources_xds.aspx"));
                samples.Add(PrepareSample("Populating from Stored Procedures", "data_sp.aspx", true, true));

                samples.Add(PrepareSample("At Run-time"));
                samples.Add(PrepareSample("Binding to DataSet", "data_sources_dataset.aspx"));
                samples.Add(PrepareSample("Binding to DataReader", "data_sources_datareader.aspx"));
                samples.Add(PrepareSample("Binding to DataTable", "data_sources_datatable.aspx"));
                samples.Add(PrepareSample("Binding to Generic Collections", "data_sources_generic.aspx"));

                samples.Add(PrepareSample("Best Performance"));
                samples.Add(PrepareSample("DataSourceNeeded Event", "data_sources_needed.aspx", true, true));
                samples.Add(PrepareSample("Paged ObjectDataSource", "data_sources_performance.aspx"));
                samples.Add(PrepareSample("Partial Load", "data_sources_partial.aspx"));
           
                samples.Add(PrepareSample("Miscellaneous"));
                samples.Add(PrepareSample("Switching Data Sources", "data_sources_switch.aspx", true));
                samples.Add(PrepareSample("Pivot Table", "data_sources_pivot.aspx"));
                samples.Add(PrepareSample("Populate on Button Click", "data_sources_button.aspx", true));
                break;

            case "Add/Edit/Delete":
                samples.Add(PrepareSample("Standard"));
                samples.Add(PrepareSample("Add/Edit/Delete Records", "commands.aspx"));
                samples.Add(PrepareSample("Multi-Record Add/Edit/Delete", "commands_multi_record.aspx"));
                samples.Add(PrepareSample("Position for New Record/Links", "commands_add_position.aspx", true, true));

                samples.Add(PrepareSample("Custom Editors"));
                samples.Add(PrepareSample("Add/Edit using Custom Forms", "commands_row_template.aspx"));
                samples.Add(PrepareSample("Sliding Row Editor", "commands_sliding_editor.aspx"));
                samples.Add(PrepareSample("Using Super Form", "commands_row_superform.aspx"));
                samples.Add(PrepareSample("Using Super Form in Window", "commands_superform_window.aspx"));                
                samples.Add(PrepareSample("Using Flyout and Custom Forms", "commands_using_flyout.aspx"));
                samples.Add(PrepareSample("Using Flyout, Custom Forms and AJAX", "commands_using_flyout_ajax.aspx"));

                samples.Add(PrepareSample("Excel-Style"));
                samples.Add(PrepareSample("Excel-Style", "commands_excel_style_full.aspx", true, false));
                samples.Add(PrepareSample("Excel-Style with Autosave", "commands_excel_style_autosave.aspx", true, true));

                samples.Add(PrepareSample("Custom Triggers"));
                samples.Add(PrepareSample("Edit using Context-Menu", "with_easymenu_edit_del_rec.aspx"));
                samples.Add(PrepareSample("Edit on Click", "commands_onclick.aspx"));
                samples.Add(PrepareSample("Edit on Double-Click", "edit_on_double_click.aspx"));
                samples.Add(PrepareSample("Edit on Double-Click with Auto-Save", "edit_on_double_click_and_autosave.aspx"));

                samples.Add(PrepareSample("Saving to Database"));
                samples.Add(PrepareSample("Automatic Updates", "commands_automatic_updates.aspx"));
                samples.Add(PrepareSample("Using SqlDataSource", "commands_declarative.aspx"));
                samples.Add(PrepareSample("Using ObjectDataSource", "commands_ods.aspx"));
                samples.Add(PrepareSample("Using Stored Procedures", "commands_full_sp.aspx", true, true));
                samples.Add(PrepareSample("Detect Unsaved Changes", "commands_unsaved_changes.aspx"));
                samples.Add(PrepareSample("Default Values for Add/Edit", "default_values_for_add.aspx"));
                samples.Add(PrepareSample("Save Changes on the Client Side", "commands_client_side_changes.aspx", true, true));

                samples.Add(PrepareSample("User Confirmation"));
                samples.Add(PrepareSample("Before Insert / Update / Delete", "clientside_confirmation.aspx"));
                samples.Add(PrepareSample("Confirmation Using Window", "clientside_events_window.aspx", false, false));

                samples.Add(PrepareSample("Handling Errors"));
                samples.Add(PrepareSample("Handling Errors", "handling_errors.aspx"));
                samples.Add(PrepareSample("Handling Errors with Row Template", "handling_errors_row.aspx"));

                break;

            case "Record Selection":
                samples.Add(PrepareSample("Standard Selection"));
                samples.Add(PrepareSample("Select Records", "selecting_records.aspx"));
                samples.Add(PrepareSample("PostBack on Select", "select_autopostback.aspx"));

                samples.Add(PrepareSample("Custom Selection"));
                samples.Add(PrepareSample("Select using Check Boxes", "select_using_checkbox.aspx", true));
                samples.Add(PrepareSample("Select using only Check Boxes", "select_using_checkbox_only.aspx", true));
                samples.Add(PrepareSample("Select using Radio Buttons", "select_using_radio.aspx"));
                samples.Add(PrepareSample("Select using Checkmark", "select_with_checkmark.aspx"));
                samples.Add(PrepareSample("Select All Group Records", "select_checkboxes_groups.aspx"));
                samples.Add(PrepareSample("Multiselect without CTRL/SHIFT", "select_without_ctrl.aspx", true));

                samples.Add(PrepareSample("Retrieve Selected Records"));
                samples.Add(PrepareSample("Find Selected Records - Client-Side", "find_selected_client_side.aspx"));
                samples.Add(PrepareSample("Find Selected Records - Server-Side", "find_selected_server_side.aspx"));                

                samples.Add(PrepareSample("Programmatic Selection"));
                samples.Add(PrepareSample("Client-Side", "select_client_side.aspx"));
                samples.Add(PrepareSample("Server-Side", "select_server_side.aspx"));
                samples.Add(PrepareSample("Select All Records", "select_all.aspx"));

                break;

            case "Columns":
                samples.Add(PrepareSample("Manipulating Columns"));
                samples.Add(PrepareSample("Resizing Columns", "resizing_columns.aspx"));
                samples.Add(PrepareSample("Dynamic Column Resizing", "columns_resizing_dynamic.aspx", true, true));
                samples.Add(PrepareSample("Reordering Columns", "columns_reordering.aspx", true, true));
                samples.Add(PrepareSample("Showing / Hiding Columns", "columns_show_hide.aspx"));

                samples.Add(PrepareSample("Column Types"));
                samples.Add(PrepareSample("CheckBoxColumn", "columns_types_checkbox.aspx", true, true));
                samples.Add(PrepareSample("CheckBoxSelectColumn", "columns_types_select.aspx", true, true));             
                
                samples.Add(PrepareSample("Settings"));
                samples.Add(PrepareSample("AutoGenerateColumns", "autogeneratecolumns.aspx"));
                samples.Add(PrepareSample("Align & HeaderAlign", "columns_align.aspx"));
                samples.Add(PrepareSample("AllowEdit / AllowDelete", "columns_edit_delete.aspx"));
                samples.Add(PrepareSample("ApplyFormatInEditMode", "columns_applyformat.aspx"));
                samples.Add(PrepareSample("DataFormatString", "columns_dataformatstring.aspx"));
                samples.Add(PrepareSample("Index", "columns_index.aspx"));
                samples.Add(PrepareSample("NullDisplayText", "columns_nulldisplaytext.aspx"));
                samples.Add(PrepareSample("ParseHTML", "columns_parse_html.aspx"));
                samples.Add(PrepareSample("ReadOnly", "columns_readonly.aspx"));
                samples.Add(PrepareSample("Wrap", "columns_wrap.aspx"));
                samples.Add(PrepareSample("Visible", "columns_visible.aspx"));
                samples.Add(PrepareSample("Width", "columns_width.aspx"));                                                
                samples.Add(PrepareSample("Relative Widths", "relative_widths.aspx"));
                samples.Add(PrepareSample("Relative Width for the Columns/Grid", "relative_widths_resize_grid.aspx"));
                samples.Add(PrepareSample("Auto Resize Columns based on Content", "columns_auto_resize.aspx", false, false));

                samples.Add(PrepareSample("Miscellaneous"));    
                samples.Add(PrepareSample("Different Styles", "columns_different_styles.aspx", false, false));                
                break;

            case "Paging":
                samples.Add(PrepareSample("Mode"));
                samples.Add(PrepareSample("Standard Paging", "paging.aspx"));
                samples.Add(PrepareSample("Manual Paging", "paging_manual.aspx"));
                
                samples.Add(PrepareSample("Customization"));
                samples.Add(PrepareSample("Position", "paging_position.aspx", true, true));              
                samples.Add(PrepareSample("Customize Paging", "customize_paging.aspx"));
                samples.Add(PrepareSample("Customize Number of Pages", "paging_customize_numbers.aspx"));
                samples.Add(PrepareSample("Customize the Page Size Drop-down", "page_size_options.aspx"));
                samples.Add(PrepareSample("Show ALL records", "paging_all_records.aspx"));

                samples.Add(PrepareSample("Client-Side API"));
                samples.Add(PrepareSample("Change Page on Client-Side", "paging_client.aspx"));                                
                
                break;

            case "Sorting":
                samples.Add(PrepareSample("Simple Sorting", "sorting.aspx"));
                samples.Add(PrepareSample("Multi-Column Sorting", "sorting_multicolumn.aspx"));
                samples.Add(PrepareSample("Sorting Week Days", "sorting_weekdays.aspx", false, false));
                samples.Add(PrepareSample("Allow Sorting for Columns", "sorting_allow_columns.aspx", true));
                break;

            case "Filtering":
                samples.Add(PrepareSample("Standard Filtering"));
                samples.Add(PrepareSample("Filtering Records", "filtering_records.aspx"));

                samples.Add(PrepareSample("Custom Filtering"));
                samples.Add(PrepareSample("Filter Templates", "filtering_templates.aspx"));
                samples.Add(PrepareSample("Filter with Date Picker", "filtering_datepicker.aspx", true, true));
                samples.Add(PrepareSample("Custom Filter Options with Templates", "filtering_custom_options.aspx"));
                samples.Add(PrepareSample("Between, By Year, By Month", "filtering_date_filters.aspx"));
                samples.Add(PrepareSample("Filtering Localized Dates (dd/MM/yyyy)", "filtering_date_localized.aspx", false, false));
                samples.Add(PrepareSample("Filtering with On-Demand ComboBox", "filtering_combobox_ondemand.aspx", true));
                samples.Add(PrepareSample("Live Search", "filtering_live.aspx", true, true));
                samples.Add(PrepareSample("Filter All with Live Search", "filtering_live_external.aspx", true, false));



                samples.Add(PrepareSample("Filter Settings"));
                samples.Add(PrepareSample("Filter Position", "filtering_position.aspx", true));
                samples.Add(PrepareSample("Initial State", "filtering_initial_state.aspx"));
                samples.Add(PrepareSample("ALL vs. ANY", "filtering_matching_type.aspx"));

                samples.Add(PrepareSample("Column Settings"));
                samples.Add(PrepareSample("Enable/Disable Filtering for Columns", "filtering_allow_filter.aspx"));
                samples.Add(PrepareSample("Show/Hide Filter Criterias", "filtering_show_criterias.aspx"));
                samples.Add(PrepareSample("Customize Filter Options", "filtering_customize_options.aspx"));

                samples.Add(PrepareSample("Programmatic Filtering"));
                samples.Add(PrepareSample("Initial Filter", "filtering_initial_filter.aspx"));
                samples.Add(PrepareSample("Programmatic Filter - Client-Side", "filtering_client_side.aspx"));
                samples.Add(PrepareSample("Alphabetic Filter", "filtering_alphabetic.aspx"));
                samples.Add(PrepareSample("Keeping Filter State", "filtering_keep_state.aspx"));
                samples.Add(PrepareSample("External Filter Buttons", "filtering_external_buttons.aspx"));
                samples.Add(PrepareSample("Filter On Blur", "filtering_onblur.aspx"));

                samples.Add(PrepareSample("Best Performance"));
                samples.Add(PrepareSample("Filter with DataSourceNeeded Event", "filtering_performance_needed.aspx", true, true));
                samples.Add(PrepareSample("Filter with Paged ObjectDataSource", "filtering_performance.aspx"));

                samples.Add(PrepareSample("Miscellaneous"));
                samples.Add(PrepareSample("Validate Filters", "filtering_validation.aspx"));
                samples.Add(PrepareSample("Master/Detail with External Filters", "filtering_external.aspx"));

                break;

            case "Templates":
                samples.Add(PrepareSample("Templates for Edit/Insert", "templates.aspx"));
                samples.Add(PrepareSample("Templates for the Filter", "filter_templates.aspx"));
                samples.Add(PrepareSample("Format Dates", "format_dates.aspx"));
                samples.Add(PrepareSample("ASP.NET Grid with Images", "with_images.aspx"));
                samples.Add(PrepareSample("Add/Edit/Delete Buttons", "templates_buttons.aspx"));
                samples.Add(PrepareSample("Add/Edit/Delete Images", "templates_images.aspx"));
                samples.Add(PrepareSample("Multi-Record Add/Edit/Delete", "templates_buttons_multi.aspx"));
                samples.Add(PrepareSample("Filter Buttons", "templates_filter_buttons.aspx"));
                samples.Add(PrepareSample("Combine Columns", "combine_columns.aspx"));
                samples.Add(PrepareSample("Hyperlinks in the Grid", "templates_hyperlinks.aspx"));
                samples.Add(PrepareSample("Wrap Headers", "templates_wrap_headers.aspx"));
                samples.Add(PrepareSample("Using Container.DataObject", "templates_dataobject.aspx"));
                samples.Add(PrepareSample("Templates for Manual Paging", "templates_manual_paging.aspx"));
                samples.Add(PrepareSample("Numbering Records", "numbering_records.aspx"));
                samples.Add(PrepareSample("GroupHeaderTemplateId", "templates_group_header.aspx"));
                samples.Add(PrepareSample("Format Currencies", "format_currencies.aspx"));
                samples.Add(PrepareSample("Custom Formatting", "custom_format_template.aspx"));
                samples.Add(PrepareSample("Get Selected Checkboxes", "templates_access_checkboxes.aspx"));
                samples.Add(PrepareSample("With Databound DropDownList", "templates_ddl_databound.aspx"));
                samples.Add(PrepareSample("Dynamic DropDownList", "templates_dynamic_ddl.aspx"));
                samples.Add(PrepareSample("With Multiselect Listbox", "templates_with_multiselect_listbox.aspx"));
                samples.Add(PrepareSample("Edit Using CheckBoxList", "templates_checkboxlist.aspx"));
                samples.Add(PrepareSample("With Databound Controls", "templates_databound_controls.aspx"));
                samples.Add(PrepareSample("DropDownList with \"New\" option", "templates_dropdown_with_new.aspx"));
                samples.Add(PrepareSample("View / Edit Details", "templates_show_details.aspx", false, false));
                samples.Add(PrepareSample("Customize for Mobile Devices", "templates_mobile_devices.aspx"));
                samples.Add(PrepareSample("Get values from textboxes", "templates_access_textboxes.aspx", false, false));
                samples.Add(PrepareSample("Detail View", "templates_detail_view.aspx", false, false));
                samples.Add(PrepareSample("Different Input Fields for Add/Edit", "enable_disable_add_edit.aspx", false, false));
                samples.Add(PrepareSample("Different Row Fields for Add/Edit", "row_templates_for_add_edit.aspx", false, false));
                samples.Add(PrepareSample("Templates for Edit/Delete Buttons", "templates_edit_delete.aspx", false, false));
                samples.Add(PrepareSample("Reports and Row Template", "combine_columns_advantage.aspx", false, false));
                samples.Add(PrepareSample("Multiple Controls", "templates_multiple_controls.aspx"));
                break;

            case "Scrolling":
                samples.Add(PrepareSample("Vertical Scroll with Fixed Headers", "scroll_vertical.aspx"));
                samples.Add(PrepareSample("Horizontal Scroll", "scroll_horizontal.aspx"));
                samples.Add(PrepareSample("Dynamic Horizontal Scroll", "scroll_horizontal_dynamic.aspx", true, true));
                samples.Add(PrepareSample("Vertical & Horizontal", "scroll_both.aspx"));
                samples.Add(PrepareSample("Automatic Scroll", "scroll_automatic.aspx"));
                samples.Add(PrepareSample("Auto-scroll during Postback", "scroll_auto_postback.aspx"));
                samples.Add(PrepareSample("Horizontal Scroll and Filter", "scroll_horizontal_and_filter.aspx"));
                samples.Add(PrepareSample("Using Percentages", "scroll_percentages.aspx"));
                samples.Add(PrepareSample("Full Window Width / Height", "scroll_percentages_full.aspx"));
                samples.Add(PrepareSample("Automatic Resize with Splitter", "scroll_automatic_resize.aspx"));
                samples.Add(PrepareSample("Fixed (Frozen) Columns", "scroll_fixed_columns.aspx"));
                samples.Add(PrepareSample("Fixed (Frozen) Rows", "scroll_fixed_rows.aspx", true, false));
                samples.Add(PrepareSample("Fixed Height", "scroll_fixed_height.aspx"));
                samples.Add(PrepareSample("Fixed Height in Percentages", "scroll_fixed_height_perc.aspx"));
                samples.Add(PrepareSample("Virtual Scrolling", "scroll_virtual.aspx", true, true));
                samples.Add(PrepareSample("Virtual Scrolling with Paging", "scroll_virtual_paging.aspx", true, true));
                samples.Add(PrepareSample("Keep Scroll On PostBack", "scroll_vertical_keep.aspx", true, true));
                break;

            case "Grouping":
                samples.Add(PrepareSample("Grouping the Records", "grouping.aspx"));
                samples.Add(PrepareSample("Allow Grouping for Columns", "grouping_endi_cols.aspx"));
                samples.Add(PrepareSample("Initial Grouping", "grouping_initial.aspx"));
                samples.Add(PrepareSample("Groups Information", "grouping_info.aspx"));
                samples.Add(PrepareSample("Multi-Page Groups Information", "grouping_info_multi.aspx"));
                samples.Add(PrepareSample("Show Collapsed Groups", "grouping_collapsed_groups.aspx"));
                samples.Add(PrepareSample("Hide Columns When Grouping", "grouping_hide_cols.aspx"));
                samples.Add(PrepareSample("Keep Expanded", "grouping_keep_state.aspx"));
                samples.Add(PrepareSample("Format the Group Headers", "grouping_format.aspx"));
                samples.Add(PrepareSample("Customize the Group Headers", "grouping_header.aspx"));
                samples.Add(PrepareSample("Custom Data in Group Headers", "grouping_custom_headers.aspx", true, true));
                samples.Add(PrepareSample("Expand / Collapse Groups", "grouping_collapse_expand.aspx", false, false));
                samples.Add(PrepareSample("Allow Changes", "grouping_changes.aspx", true, true));
                samples.Add(PrepareSample("Group using CheckBoxes", "grouping_checkboxes.aspx", true));
                break;

            case "Totals / Sub-Totals":
                samples.Add(PrepareSample("Totals", "totals.aspx"));
                samples.Add(PrepareSample("Sub-Totals in Group Footers", "totals_groups.aspx"));
                samples.Add(PrepareSample("Sub-Totals in Group Headers", "totals_groups_headers.aspx", true));
                samples.Add(PrepareSample("Aggregates", "totals_aggregates.aspx"));
                samples.Add(PrepareSample("Totals of Selected Records", "totals_client.aspx"));
                samples.Add(PrepareSample("Summary Row", "totals_multiple_rows.aspx"));
                break;

            case "Master / Detail":
                samples.Add(PrepareSample("Loading Mode"));
                samples.Add(PrepareSample("Load At Once (OnLoad)", "master_detail_onload.aspx"));
                samples.Add(PrepareSample("Load On Demand (OnCallback)", "master_detail_oncallback.aspx"));
                samples.Add(PrepareSample("Load On PostBack", "master_detail_onpostback.aspx"));
                samples.Add(PrepareSample("Load On PostBack with UpdatePanel", "master_detail_onpostback_withupdatepanel.aspx", true, false));

                samples.Add(PrepareSample("Populating with Data"));
                samples.Add(PrepareSample("Populate from ObjectDataSource", "master_detail_populate_ods.aspx"));
                samples.Add(PrepareSample("Populate from DataSet", "master_detail_populate_ds.aspx"));
                samples.Add(PrepareSample("Populate from Generic Collections", "master_detail_populate_gc.aspx"));
                samples.Add(PrepareSample("Populate from Stored Procedures", "master_detail_populate_sp.aspx", true, true));

                samples.Add(PrepareSample("Add / Edit / Delete"));
                samples.Add(PrepareSample("Add / edit / delete at runtime", "master_detail_full.aspx", false, true));
                samples.Add(PrepareSample("Declarative add / edit / delete", "master_detail_full_declarative.aspx", true, true));
                samples.Add(PrepareSample("Using Stored Procedures", "master_detail_full_sp.aspx", true, true));
                samples.Add(PrepareSample("Excel-Style Editing", "master_detail_excel_style.aspx", true, false));
                samples.Add(PrepareSample("Using SuperForm inside Window", "master_detail_superform_window.aspx", true, true));
                samples.Add(PrepareSample("Handling Errors", "master_detail_error.aspx", true, true));

                samples.Add(PrepareSample("Self-Reference Display"));
                samples.Add(PrepareSample("TreeView Hierarchy", "master_detail_self_reference.aspx", true, true));

                samples.Add(PrepareSample("Settings"));
                samples.Add(PrepareSample("Show Empty Details - OnLoad", "master_detail_show_empty.aspx"));
                samples.Add(PrepareSample("DetailGrid State", "master_detail_state.aspx"));

                samples.Add(PrepareSample("Miscellaneous"));
                samples.Add(PrepareSample("Multiple Details on the Same Level", "master_detail_same_level.aspx"));
                samples.Add(PrepareSample("Unlimited Number of Levels", "master_detail_unlimited.aspx"));                
                samples.Add(PrepareSample("Multiple Foreign Keys", "master_detail_foreign.aspx"));
                samples.Add(PrepareSample("Display Info in Flyout", "master_detail_flyout.aspx", true, true));

                samples.Add(PrepareSample("Templates"));
                samples.Add(PrepareSample("Templates for Action Buttons", "master_detail_action.aspx"));
                samples.Add(PrepareSample("Detail Grid inside Row Edit Template", "master_detail_row_template.aspx", false, false));
                samples.Add(PrepareSample("Inline Templates inside Detail Grid", "master_detail_with_inline_template.aspx", true, false));
                samples.Add(PrepareSample("Row Templates inside Detail Grid", "master_detail_with_row_template.aspx", true, true));


                samples.Add(PrepareSample("Customizations"));
                samples.Add(PrepareSample("Expand / Collapse All", "master_detail_toggle.aspx"));
                samples.Add(PrepareSample("Client-Side Manipulation", "master_detail_client.aspx"));
                samples.Add(PrepareSample("Get Selected Records", "master_detail_selected_records.aspx"));
                samples.Add(PrepareSample("Expand / Collapse using Hyperlinks", "master_detail_without_plusminus.aspx", true, true));   
                samples.Add(PrepareSample("Expand / Collapse On Select", "master_detail_onselect.aspx"));
                samples.Add(PrepareSample("Different Styles", "master_detail_styles.aspx"));
                samples.Add(PrepareSample("Select on Expand / Collapse", "master_detail_select_on_expand.aspx"));
                samples.Add(PrepareSample("Expand a Single Detail Grid", "master_detail_single.aspx"));
                samples.Add(PrepareSample("Keep Expanded Details on PostBack", "master_detail_keep_state.aspx", true, true));
                samples.Add(PrepareSample("Separated Master/Detail Grids", "master_details.aspx"));
                samples.Add(PrepareSample("Expand / Collapse on Client Side", "master_detail_expand_client.aspx", false, false));
                samples.Add(PrepareSample("Auto-Expanding (Fluid) Width", "master_detail_autowidth.aspx", true, true));
                break;

            case "Column Sets":
                samples.Add(PrepareSample("Column Sets", "column_sets.aspx", true, false));
                samples.Add(PrepareSample("Column Sets on Multiple Levels", "column_sets_levels.aspx", true, false));
                samples.Add(PrepareSample("Scroll Column Sets Horizontally", "column_sets_scrolling.aspx", true, false));
                samples.Add(PrepareSample("Column Sets with Grouping", "column_sets_grouping.aspx", true, false));
                break;

            case "Exporting":
                samples.Add(PrepareSample("Export to Excel / Word on Client Side", "export_client_side.aspx"));
                samples.Add(PrepareSample("Export to Excel / Word on Server Side", "export_server_side.aspx"));
                samples.Add(PrepareSample("Export to CSV", "export_csv.aspx", true, true));
                samples.Add(PrepareSample("Export Large Data Sets", "export_large_data_set.aspx", true, true));
                samples.Add(PrepareSample("Export Master / Detail Grids", "export_master_detail.aspx"));
                samples.Add(PrepareSample("Export Groups", "export_groups.aspx"));
                samples.Add(PrepareSample("Export Totals / Subtotals", "export_totals.aspx"));
                samples.Add(PrepareSample("Export Templates", "export_templates.aspx"));
                samples.Add(PrepareSample("Export Images", "export_images.aspx"));
                samples.Add(PrepareSample("Title / Footer", "export_title.aspx"));
                samples.Add(PrepareSample("Export Selected Records", "export_selected_records.aspx", true, true));
                samples.Add(PrepareSample("Export CheckBoxColumn", "export_checkboxcolumn.aspx", true, true));
                samples.Add(PrepareSample("Export Multiple Grids as a Single File", "export_multiple.aspx", true, true));
                samples.Add(PrepareSample("Export Column Sets", "export_column_sets.aspx", true, false));
                samples.Add(PrepareSample("Customize Exported Files", "export_customize.aspx"));
                samples.Add(PrepareSample("Customize Individual Rows", "export_custom_rows.aspx"));
                samples.Add(PrepareSample("Life Time for Exported Files", "export_lifetime.aspx"));
                samples.Add(PrepareSample("OnClientExportStart/Finish", "export_client_events.aspx"));
                samples.Add(PrepareSample("ExportedFilesTargetWindow", "export_target.aspx"));
                break;

            case "Accessibility":
                samples.Add(PrepareSample("Key Navigation", "key_navigation.aspx"));
                samples.Add(PrepareSample("Customizing Key Navigation", "key_navigation_customize.aspx"));
                break;

            case "Localization":
                samples.Add(PrepareSample("Localization", "localization.aspx"));
                samples.Add(PrepareSample("Custom Localization", "localization_customize.aspx"));
                break;

            case "Client-Side Events":
                samples.Add(PrepareSample("Add/Edit/Delete", "clientside_events.aspx"));
                samples.Add(PrepareSample("Expose the Sender", "events_client_sender.aspx"));
                break;

            case "Server-Side Events":
                samples.Add(PrepareSample("OnRowCreated & OnRowDataBound", "events_row.aspx"));
                samples.Add(PrepareSample("OnColumnsCreated", "events_columns.aspx"));
                samples.Add(PrepareSample("Row Title", "row_title.aspx", false, false));
                break;

            case "Printing":
                samples.Add(PrepareSample("Printing the Grid", "print.aspx"));
                samples.Add(PrepareSample("Printing All Pages", "print_all.aspx"));
                samples.Add(PrepareSample("Printing All Records without Scrollbars", "print_all_records.aspx", true, true));
                samples.Add(PrepareSample("Printing Selected Columns", "print_selected_columns.aspx", true, true));
                samples.Add(PrepareSample("Printing Selected Records", "print_selected_records.aspx", true, true));
                break;

            case "Validation":
                samples.Add(PrepareSample("Grid with ASP.NET Validators", "integration_validators.aspx", false, false));
                samples.Add(PrepareSample("Validate Super Form inside Grid", "validation_superform.aspx", false));
                samples.Add(PrepareSample("Type Validation", "type_validation.aspx"));
                break;

            case "Integration":
                if (RbtnAspNet.Checked)
                {
                    samples.Add(PrepareSample("E-Mail Client", "integration_email_client.aspx"));
                    samples.Add(PrepareSample("File Browser", "integration_file_browser.aspx"));
                }
                samples.Add(PrepareSample("Grid with Easy-Menu", "integration_easymenu.aspx"));
                samples.Add(PrepareSample("Combobox inside Templates", "integration_cbo_tpl.aspx"));
                samples.Add(PrepareSample("Customers", "integration_customers.aspx", false, false));
                samples.Add(PrepareSample("Grid with On-Demand ComboBox", "integration_combobox_ondemand.aspx", true, true));
                samples.Add(PrepareSample("Grid with DatePicker", "integration_datepicker.aspx"));
                samples.Add(PrepareSample("Grid with Flyout", "integration_flyout.aspx"));
                samples.Add(PrepareSample("Grid and MasterPages", "grid_and_master_pages.aspx"));
                samples.Add(PrepareSample("Grid with AJAX TabStrip", "integration_ajax_tabstrip.aspx"));
                samples.Add(PrepareSample("HTML Editor Inline", "integration_html_editor.aspx"));
                samples.Add(PrepareSample("HTML Editor in Row Template", "integration_html_editor_row.aspx"));
                samples.Add(PrepareSample("Grid with Window", "integrate_window.aspx"));
                samples.Add(PrepareSample("Using Tooltips", "integration_flyout_tooltip.aspx", false, false));
                samples.Add(PrepareSample("Grid Inside Window", "integration_inside_window.aspx", false, false));
                samples.Add(PrepareSample("Task List", "task_list.aspx", false, false));
                samples.Add(PrepareSample("Grid with Flyout and AJAX Page", "integration_flyout_ajaxpage.aspx", false, false));
                samples.Add(PrepareSample("Purchase Order", "custom_order.aspx", false, false));
                samples.Add(PrepareSample("Context menu and CheckBoxes", "integration_checkbox_em.aspx", true, true));
                break;

            case "ASP.NET AJAX":
                samples.Add(PrepareSample("Live Quotes", "forex_signal.aspx", false, false));
                samples.Add(PrepareSample("With AJAX MaskedEditExtender", "ajax_toolkit.aspx"));
                samples.Add(PrepareSample("Millions of Records", "ajax_postbackmode.aspx", false, false));
                samples.Add(PrepareSample("Populate Edit Fields", "ajax_populate_edit_fields.aspx", false, false));
                samples.Add(PrepareSample("View Row Details", "ajax_view_row_details.aspx", false, false));
                samples.Add(PrepareSample("Cascading ComboBoxes", "ajax_cascading_comboboxes_inline.aspx", false, false));
                samples.Add(PrepareSample("Cascading ComboBoxes in Row Template", "ajax_cascading_comboboxes.aspx", false, false));
                break;

            case "State Keeping":
                samples.Add(PrepareSample("Save Column Widths", "state_save_widths.aspx"));
                samples.Add(PrepareSample("Keep Current Page", "state_currentpage.aspx"));
                samples.Add(PrepareSample("Keep Current Sort Order", "state_sorting.aspx"));
                break;

            case "Other Features":
                samples.Add(PrepareSample("ShowLoadingMessage", "show_loading_message.aspx"));
                samples.Add(PrepareSample("Hover Effects", "hover_effects.aspx"));
                samples.Add(PrepareSample("Multiple Grids", "multiple_grids.aspx"));
                samples.Add(PrepareSample("Large Grids", "large_grids.aspx"));
                samples.Add(PrepareSample("Refresh the Records of the Grid", "refresh_records.aspx"));
                samples.Add(PrepareSample("Clearing the Grid", "clearing_grid.aspx"));
                samples.Add(PrepareSample("Generate IDs for Records", "generate_record_ids.aspx"));
                samples.Add(PrepareSample("Client-Side Model", "client_side_model.aspx"));
                samples.Add(PrepareSample("Find and Replace", "find_replace.aspx"));
                samples.Add(PrepareSample("Using ASP.NET Themes/Skins", "themes_skins.aspx"));
                samples.Add(PrepareSample("Re-order the Rows", "move_row_up_down.aspx"));
                samples.Add(PrepareSample("Multi Columns Validation", "onchange_validation.aspx", false, false));
                samples.Add(PrepareSample("Using RadioButtons inside Edit Template", "with_radio_button.aspx", false, false));
                samples.Add(PrepareSample("External Buttons", "templates_buttons_multi_cus.aspx", false, false));
                samples.Add(PrepareSample("Validate unknown columns", "validate_columns.aspx"));
                samples.Add(PrepareSample("Inline Validation", "inline_validator.aspx", false, false));
                break;

            case "Mode":
                samples.Add(PrepareSample("Callback Mode", "callback_mode.aspx"));
                samples.Add(PrepareSample("Postback Mode", "postback_mode.aspx"));
                break;

            case "Layout Customization":
                samples.Add(PrepareSample("Show/Hide Header/Footer", "header_footer.aspx"));
                samples.Add(PrepareSample("Align Elements in Footer", "customization_footer_alignment.aspx"));
                samples.Add(PrepareSample("Wrap Footer Elements", "customization_wrap_footer.aspx"));
                samples.Add(PrepareSample("Heading", "customization_extra_heading.aspx", true, true));
                break;

            case "Rows":
                samples.Add(PrepareSample("Reorder Rows", "rows_reorder.aspx", true, true));
                samples.Add(PrepareSample("Reorder Rows using Drag and Drop", "rows_draganddrop.aspx", true, false));
                samples.Add(PrepareSample("Customize Individual Rows", "rows_custom.aspx", true, true));
                break;
        }

        
        StringBuilder samplesContent = new StringBuilder();
        samplesContent.Append("<div class=\"header\"><b>" + categoryName + "</b> - <span class=\"headerNumber\">" + mainCategories[categoryName].ToString() + "</span></div>");

        foreach (Dictionary<string, string> sample in samples)
        {
            if (sample["URL"] != "")
            {
                if (bool.Parse(sample["HasCsVb"]) == true || type == "aspnet_")
                {
                    samplesContent.Append("<div class=\"link\"><a href=\"" + type + sample["URL"] + "\">" + sample["Name"] + (bool.Parse(sample["IsNew"]) == true ? " <b class=\"new-sample\">New</b>" : "") + "</a></div>");
                    samplesContent.Append("<div class=\"link-file\">" + type + sample["URL"] + "</div>");
                    samplesContent.Append("<div class=\"link-clear\"></div>");
                }
            }
            else
            {
                samplesContent.Append("<div class=\"sub-header\">" + sample["Name"] + "</div>");
            }
        }

        return samplesContent.ToString();
    }

    protected Dictionary<string, string> PrepareSample(string name)
    {
        return PrepareSample(name, "", false, true);
    }

    protected Dictionary<string, string> PrepareSample(string name, string url)
    {
        return PrepareSample(name, url, false, true);
    }

    protected Dictionary<string, string> PrepareSample(string name, string url, bool isNew)
    {
        return PrepareSample(name, url, isNew, true);
    }

    protected Dictionary<string, string> PrepareSample(string name, string url, bool isNew, bool hasCsVb)
    {
        Dictionary<string, string> tempDict = new Dictionary<string, string>();

        tempDict.Add("Name", name);
        tempDict.Add("URL", url);
        tempDict.Add("IsNew", isNew.ToString());
        tempDict.Add("HasCsVb", hasCsVb.ToString());

        return tempDict;
    }

    protected void DisplayPathToExamples()
    {
        try
        {
            XmlTextReader oXMLReader = null;
            oXMLReader = new XmlTextReader(Server.MapPath("examples.xml"));
            while (oXMLReader.Read())
            {
                if (oXMLReader.NodeType == XmlNodeType.Element && oXMLReader.Name == "path")
                {
                    lblPath.Text = "<b>Path to folder with Grid examples: </b>" + oXMLReader.ReadString();
                }
            }
            oXMLReader.Close();
        }
        catch (Exception ex)
        {
            if (ex != null) { ex = null; }
        }

        if (Request.QueryString["type"] != null)
        {
            ExamplesType.Value = Request.QueryString["type"].ToString();
        }
    }
}