namespace System.Web.Mvc.Html
{
    using System.Collections;
    using System.Collections.Generic;
    using System.Diagnostics.CodeAnalysis;
    using System.Globalization;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Text;

    public static class GroupedSelectExtensions
    {
        #region DropDownList
        //public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper , string name , string childName , string url )
        //{
        //    return DropDownList( htmlHelper , name , null /* selectList */, null /* optionLabel */, null /* htmlAttributes */, name , null /* childOptionLabel */, url );
        //}

        //public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper , string name , string optionLabel , string childName , string childOptionLabel , string url )
        //{
        //    return DropDownList( htmlHelper , name , null /* selectList */, optionLabel , null /* htmlAttributes */, childName , childOptionLabel , url );
        //}

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList )
        {
            return DropDownList( htmlHelper, name, selectList, null /* optionLabel */, null /* htmlAttributes */, null /* childName */ , null /* childOptionLabel */, null /* url */ );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string childName, string url )
        {
            return DropDownList( htmlHelper, name, selectList, null /* optionLabel */, null /* htmlAttributes */, childName, null /* childOptionLabel */, url );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, object htmlAttributes )
        {
            return DropDownList( htmlHelper, name, selectList, null /* optionLabel */ , htmlAttributes, null /* childName */ , null /* childOptionLabel */, null /* url */ );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, object htmlAttributes, string childName, string url )
        {
            return DropDownList( htmlHelper, name, selectList, null /* optionLabel */, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), childName, null /* childOptionLabel */, url );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, IDictionary<string, object> htmlAttributes )
        {
            return DropDownList( htmlHelper, name, selectList, null /* optionLabel */, htmlAttributes, null /* childName */ , null /* childOptionLabel */, null /* url */ );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, IDictionary<string, object> htmlAttributes, string childName, string url )
        {
            return DropDownList( htmlHelper, name, selectList, null /* optionLabel */, htmlAttributes, childName, null /* childOptionLabel */, url );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel )
        {
            return DropDownList( htmlHelper, name, selectList, optionLabel, null /* htmlAttributes */, null /* childName */ , null /* childOptionLabel */ , null /* url */ );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, string childName, string childOptionLabel, string url )
        {
            return DropDownList( htmlHelper, name, selectList, optionLabel, null /* htmlAttributes */, childName, childOptionLabel, url );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, object htmlAttributes )
        {
            return DropDownList( htmlHelper, name, selectList, optionLabel, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), null /* childName */ , null /* childOptionLabel */ , null /* url */ );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, object htmlAttributes, string childName, string childOptionLabel, string url )
        {
            return DropDownList( htmlHelper, name, selectList, optionLabel, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), childName, childOptionLabel, url );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, IDictionary<string, object> htmlAttributes )
        {
            return DropDownListHelper( htmlHelper, name, selectList, optionLabel, htmlAttributes, null /* childName */ , null /* childOptionLabel */ , null /* url */ );
        }

        public static MvcHtmlString DropDownList( this HtmlHelper htmlHelper, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, IDictionary<string, object> htmlAttributes, string childName, string childOptionLabel, string url )
        {
            return DropDownListHelper( htmlHelper, name, selectList, optionLabel, htmlAttributes, childName, childOptionLabel, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList )
        {
            return DropDownListFor( htmlHelper, expression, selectList, null /* optionLabel */, null /* htmlAttributes */, null /* childExpression */ , null /* childOptionLabel */, null /* url */ );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, Expression<Func<TModel, TProperty>> childExpression, string url )
        {
            return DropDownListFor( htmlHelper, expression, selectList, null /* optionLabel */, null /* htmlAttributes */, childExpression, null /* childOptionLabel */, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, object htmlAttributes, Expression<Func<TModel, TProperty>> childExpression, string url )
        {
            return DropDownListFor( htmlHelper, expression, selectList, null /* optionLabel */, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), childExpression, null /* childOptionLabel */, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, IDictionary<string, object> htmlAttributes, Expression<Func<TModel, TProperty>> childExpression, string url )
        {
            return DropDownListFor( htmlHelper, expression, selectList, null /* optionLabel */, htmlAttributes, childExpression, null /* childOptionLabel */, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, Expression<Func<TModel, TProperty>> childExpression, string childOptionLabel, string url )
        {
            return DropDownListFor( htmlHelper, expression, selectList, optionLabel, null /* htmlAttributes */, childExpression, childOptionLabel, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, object htmlAttributes, Expression<Func<TModel, TProperty>> childExpression, string childOptionLabel, string url )
        {
            return DropDownListFor( htmlHelper, expression, selectList, optionLabel, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), childExpression, childOptionLabel, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters", Justification = "Users cannot use anonymous methods with the LambdaExpression type" )]
        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, IDictionary<string, object> htmlAttributes, Expression<Func<TModel, TProperty>> childExpression, string childOptionLabel, string url )
        {
            if ( expression == null )
            {
                throw new ArgumentNullException( "expression" );
            }

            return DropDownListHelper( htmlHelper, ExpressionHelper.GetExpressionText( expression ), selectList, optionLabel, htmlAttributes, ExpressionHelper.GetExpressionText( childExpression ), childOptionLabel, url );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, object htmlAttributes )
        {
            return DropDownListFor( htmlHelper, expression, selectList, null /* optionLabel */, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), null /* childExpression */ , null /* childOptionLabel */, null /* url */ );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, IDictionary<string, object> htmlAttributes )
        {
            return DropDownListFor( htmlHelper, expression, selectList, null /* optionLabel */, htmlAttributes, null /* childExpression */ , null /* childOptionLabel */, null /* url */ );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel )
        {
            return DropDownListFor( htmlHelper, expression, selectList, optionLabel, null /* htmlAttributes */, null /* childExpression */ , null /* childOptionLabel */ , null /* url */ );
        }

        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, object htmlAttributes )
        {
            return DropDownListFor( htmlHelper, expression, selectList, optionLabel, HtmlHelper.AnonymousObjectToHtmlAttributes( htmlAttributes ), null /* childExpression */ , null /* childOptionLabel */ , null /* url */ );
        }

        [SuppressMessage( "Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters", Justification = "Users cannot use anonymous methods with the LambdaExpression type" )]
        [SuppressMessage( "Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString DropDownListFor<TModel, TProperty>( this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, IDictionary<string, object> htmlAttributes )
        {
            if ( expression == null )
            {
                throw new ArgumentNullException( "expression" );
            }

            return DropDownListHelper( htmlHelper, ExpressionHelper.GetExpressionText( expression ), selectList, optionLabel, htmlAttributes );
        }


        private static MvcHtmlString DropDownListHelper( HtmlHelper htmlHelper, string expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, IDictionary<string, object> htmlAttributes )
        {
            return SelectInternal( htmlHelper, optionLabel, expression, selectList, false /* allowMultiple */, htmlAttributes, null /* childExpression */ , null /* childOptionLabel */ , null /* url */);
        }

        private static MvcHtmlString DropDownListHelper( HtmlHelper htmlHelper, string expression, IDictionary<string, IEnumerable<SelectListItem>> selectList, string optionLabel, IDictionary<string, object> htmlAttributes, string childExpression, string childOptionLabel, string url )
        {
            return SelectInternal( htmlHelper, optionLabel, expression, selectList, false /* allowMultiple */, htmlAttributes, childExpression, childOptionLabel, url );
        }
        #endregion

        #region Helper methods

        private static IDictionary<string, IEnumerable<SelectListItem>> GetSelectData( this HtmlHelper htmlHelper, string name )
        {
            object o = null;
            if ( htmlHelper.ViewData != null )
            {
                o = htmlHelper.ViewData.Eval( name );
            }
            if ( o == null )
            {
                throw new InvalidOperationException(
                    String.Format(
                        CultureInfo.CurrentCulture,
                        "There is no ViewData item of type '{1}' that has the key '{0}'.", /*MvcResources.HtmlHelper_MissingSelectData*/
                        name,
                        "IDictionary<string , IEnumerable<SelectListItem>>" ) );
            }
            IDictionary<string , IEnumerable<SelectListItem>> selectList = o as IDictionary<string, IEnumerable<SelectListItem>>;
            if ( selectList == null )
            {
                throw new InvalidOperationException(
                    String.Format(
                        CultureInfo.CurrentCulture,
                        "The ViewData item that has the key '{0}' is of type '{1}' but must be of type '{2}'." /*MvcResources.HtmlHelper_WrongSelectDataType*/ ,
                        name,
                        o.GetType( ).FullName,
                        "IDictionary<string , IEnumerable<SelectListItem>>" ) );
            }
            return selectList;
        }

        internal static string ListItemToOption( string category, IEnumerable<SelectListItem> items )
        {
            TagBuilder builder = new TagBuilder( "optgroup" );
            builder.Attributes[ "label" ] = category;

            // Convert each ListItem to an <option> tag
            StringBuilder listItemBuilder = new StringBuilder( );

            foreach ( SelectListItem item in items )
            {
                listItemBuilder.AppendLine( ListItemToOption( item ) );
            }

            builder.InnerHtml = listItemBuilder.ToString( );

            return builder.ToString( TagRenderMode.Normal );
        }

        internal static string ListItemToOption( SelectListItem item )
        {
            TagBuilder builder = new TagBuilder( "option" )
            {
                InnerHtml = HttpUtility.HtmlEncode( item.Text )
            };
            if ( item.Value != null )
            {
                builder.Attributes[ "value" ] = item.Value;
            }
            if ( item.Selected )
            {
                builder.Attributes[ "selected" ] = "selected";
            }
            return builder.ToString( TagRenderMode.Normal );
        }

        private static MvcHtmlString SelectInternal( this HtmlHelper htmlHelper, string optionLabel, string name, IDictionary<string, IEnumerable<SelectListItem>> selectList, bool allowMultiple, IDictionary<string, object> htmlAttributes, string childName, string childOptionLabel, string url )
        {
            string fullName = htmlHelper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName( name );
            if ( String.IsNullOrEmpty( fullName ) )
            {
                throw new ArgumentException( "Value cannot be null or empty." /*MvcResources.Common_NullOrEmpty*/ , "name" );
            }

            bool usedViewData = false;

            // If we got a null selectList, try to use ViewData to get the list of items.
            if ( selectList == null )
            {
                selectList = htmlHelper.GetSelectData( fullName );
                usedViewData = true;
            }

            object defaultValue = ( allowMultiple ) ? GetModelStateValue( htmlHelper, fullName, typeof( string[ ] ) ) : GetModelStateValue( htmlHelper, fullName, typeof( string ) );

            // If we haven't already used ViewData to get the entire list of items then we need to
            // use the ViewData-supplied value before using the parameter-supplied value.
            if ( !usedViewData )
            {
                if ( defaultValue == null )
                {
                    defaultValue = htmlHelper.ViewData.Eval( fullName );
                }
            }

            // Convert each ListItem to an <option> tag
            StringBuilder listItemBuilder = new StringBuilder( );

            if ( defaultValue != null )
            {
                IEnumerable defaultValues = ( allowMultiple ) ? defaultValue as IEnumerable : new[ ] { defaultValue };
                IEnumerable<string> values = from object value in defaultValues select Convert.ToString( value, CultureInfo.CurrentCulture );
                HashSet<string> selectedValues = new HashSet<string>( values, StringComparer.OrdinalIgnoreCase );

                Dictionary<string, IEnumerable<SelectListItem>> newSelectListDictionary = 
    new Dictionary<string, IEnumerable<SelectListItem>>( );
                foreach ( var category in selectList.Keys )
                {
                    List<SelectListItem> newSelectList = new List<SelectListItem>( );

                    foreach ( SelectListItem item in selectList[ category ] )
                    {
                        item.Selected = ( item.Value != null ) ?
                            selectedValues.Contains( item.Value ) :
                            selectedValues.Contains( item.Text );
                        newSelectList.Add( item );
                    }

                    newSelectListDictionary.Add( category, newSelectList );
                }
                selectList = newSelectListDictionary;
            }

            // Make optionLabel the first item that gets rendered.
            if ( optionLabel != null )
            {
                listItemBuilder.AppendLine( ListItemToOption( new SelectListItem( ) { Text = optionLabel, Value = String.Empty, Selected = false } ) );
            }

            foreach ( var category in selectList.Keys )
            {
                listItemBuilder.AppendLine( ListItemToOption( category, selectList[ category ] ) );
            }

            TagBuilder tagBuilder = new TagBuilder( "select" )
            {
                InnerHtml = listItemBuilder.ToString( )
            };

            tagBuilder.MergeAttributes( htmlAttributes );
            tagBuilder.MergeAttribute( "name", fullName, true /* replaceExisting */);
            tagBuilder.GenerateId( fullName );

            if ( allowMultiple )
            {
                tagBuilder.MergeAttribute( "multiple", "multiple" );
            }

            // If there are any errors for a named field, we add the css attribute.
            ModelState modelState;
            if ( htmlHelper.ViewData.ModelState.TryGetValue( fullName, out modelState ) )
            {
                if ( modelState.Errors.Count > 0 )
                {
                    tagBuilder.AddCssClass( HtmlHelper.ValidationInputCssClassName );
                }
            }

            tagBuilder.MergeAttributes( htmlHelper.GetUnobtrusiveValidationAttributes( name ) );

            if ( !( string.IsNullOrEmpty( childName ) || string.IsNullOrEmpty( url ) ) )
            {
                StringBuilder jQueryString = new StringBuilder( )
                .Append( tagBuilder.ToString( TagRenderMode.Normal ) )
                    .Append( "<script type='text/javascript'>" )
                        .Append( "$(function () {" )
                            .Append( "$('#" ).Append( childName ).Append( "').attr('disabled', 'disabled');" )
                            .Append( "$('#" ).Append( fullName ).Append( "').live('change', function () {" )
                                .Append( "$('#" ).Append( childName ).Append( "').html('');" )
                                .Append( "$('#" ).Append( childName ).Append( "').append($('<option></option>').html('" ).Append( childOptionLabel ).Append( "'));" )
                                .Append( "if ($('#" ).Append( fullName ).Append( " option:selected').val() != '') {" )
                                    .Append( "$.get('" ).Append( url ).Append( "/' + $('#" ).Append( fullName ).Append( " option:selected').val(), function (data) {" )
                                        .Append( "for (var i = 0; i < data.length; i++) {" )
                                            .Append( "var item = data[i];" )
                                            .Append( "$('#" ).Append( childName ).Append( "').append($('<option></option>').val(item.Id).html(item.Name));" )
                                        .Append( "}" )
                                        .Append( "$('#" ).Append( childName ).Append( "').attr('disabled', '');" )
                                    .Append( "});" )
                                .Append( "}" )
                                .Append( "else {" )
                                    .Append( "$('#" ).Append( childName ).Append( "').attr('disabled', 'disabled');" )
                                .Append( "}" )
                            .Append( "});" )
                        .Append( "});" )
                    .Append( "</script>" );

                return MvcHtmlString.Create( jQueryString.ToString( ) );
            }

            return MvcHtmlString.Create( tagBuilder.ToString( TagRenderMode.Normal ) );
        }

        internal static object GetModelStateValue( HtmlHelper htmlHelper, string key, Type destinationType )
        {
            ModelState modelState;
            if ( htmlHelper.ViewData.ModelState.TryGetValue( key, out modelState ) )
            {
                if ( modelState.Value != null )
                {
                    return modelState.Value.ConvertTo( destinationType, null /* culture */);
                }
            }
            return null;
        }
        #endregion
    }
}