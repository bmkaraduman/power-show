namespace System.Web.Mvc.Html
{
    using System.ComponentModel.DataAnnotations;
    using System.Diagnostics.CodeAnalysis;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Text;

    public static class LabelExtensionsEx
    {
        public static MvcHtmlString Label( this HtmlHelper html , string expression , string cssFieldId , string cssClassName )
        {
            cssFieldId = SanitizeCSSFieldId( cssFieldId );
            cssClassName = SanitizeCSSClassName( cssClassName );

            return Label( html , expression , null , cssFieldId , cssClassName );
        }

        public static MvcHtmlString Label( this HtmlHelper html , string expression , string labelText , string cssFieldId , string cssClassName )
        {
            cssFieldId = SanitizeCSSFieldId( cssFieldId );
            cssClassName = SanitizeCSSClassName( cssClassName );
            return LabelHelper( html ,
                               ModelMetadata.FromStringExpression( expression , html.ViewData ) ,
                               expression ,
                               labelText , cssFieldId , cssClassName );
        }

        [SuppressMessage( "Microsoft.Design" , "CA1006:DoNotNestGenericTypesInMemberSignatures" , Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString LabelFor<TModel , TValue>( this HtmlHelper<TModel> html , Expression<Func<TModel , TValue>> expression , string cssFieldId , string cssClassName )
        {
            cssFieldId = SanitizeCSSFieldId( cssFieldId );
            cssClassName = SanitizeCSSClassName( cssClassName );
            return LabelFor<TModel , TValue>( html , expression , null , cssFieldId , cssClassName );
        }

        [SuppressMessage( "Microsoft.Design" , "CA1006:DoNotNestGenericTypesInMemberSignatures" , Justification = "This is an appropriate nesting of generic types" )]
        public static MvcHtmlString LabelFor<TModel , TValue>( this HtmlHelper<TModel> html , Expression<Func<TModel , TValue>> expression , string labelText , string cssFieldId , string cssClassName )
        {
            cssFieldId = SanitizeCSSFieldId( cssFieldId );
            cssClassName = SanitizeCSSClassName( cssClassName );

            return LabelHelper( html ,
                               ModelMetadata.FromLambdaExpression( expression , html.ViewData ) ,
                               ExpressionHelper.GetExpressionText( expression ) ,
                               labelText , cssFieldId , cssClassName );
        }

        public static MvcHtmlString LabelForModel( this HtmlHelper html , string cssFieldId , string cssClassName )
        {
            cssFieldId = SanitizeCSSFieldId( cssFieldId );
            cssClassName = SanitizeCSSClassName( cssClassName );
            return LabelForModel( html , null , cssFieldId , cssClassName );
        }

        public static MvcHtmlString LabelForModel( this HtmlHelper html , string labelText , string cssFieldId , string cssClassName )
        {
            cssFieldId = SanitizeCSSFieldId( cssFieldId );
            cssClassName = SanitizeCSSClassName( cssClassName );
            return LabelHelper( html , html.ViewData.ModelMetadata , String.Empty , labelText , cssFieldId , cssClassName );
        }

        internal static MvcHtmlString LabelHelper(
            HtmlHelper html ,
            ModelMetadata metadata ,
            string htmlFieldName ,
            string labelText = null ,
            string cssFieldId = "self" ,
            string cssClassName = "field-required" )
        {
            string resolvedLabelText = 
        labelText ?? metadata.DisplayName ??
                metadata.PropertyName ?? htmlFieldName.Split( '.' ).Last( );

            if ( String.IsNullOrEmpty( resolvedLabelText ) )
            {
                return MvcHtmlString.Empty;
            }

            TagBuilder tag = new TagBuilder( "label" );
            tag.Attributes.Add(
                "for" ,
                TagBuilder.CreateSanitizedId(
                    html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName( htmlFieldName )
                )
            );
            tag.SetInnerText( resolvedLabelText );


            //The Required attribute has allow multiple false
            bool isRequired = 
        metadata.ContainerType.GetProperty( metadata.PropertyName )
                    .GetCustomAttributes( typeof( RequiredAttribute ) , false )
                    .Length == 1;

            if ( isRequired )
            {
                if ( cssFieldId.Equals( "self" , StringComparison.OrdinalIgnoreCase ) )
                {
                    tag.AddCssClass( cssClassName );
                }
                else
                {
                    if ( cssFieldId.StartsWith( "#" ) )
                    {
                        cssFieldId = cssFieldId.Remove( 0 , 1 );
                    }
                    StringBuilder jQueryString = new StringBuilder( )
                        .Append( tag.ToString( TagRenderMode.Normal ) )
                        .Append( "<script type='text/javascript'>" )
                        .Append( "$(document).ready(function () {" )
                        .Append( "$('#" ).Append( cssFieldId ).Append( "').addClass('" )
                        .Append( cssClassName ).Append( "\')" )
                        .Append( "});" )
                        .Append( "</script> " );

                    return MvcHtmlString.Create( jQueryString.ToString( ) );
                }
            }

            return MvcHtmlString.Create( tag.ToString( TagRenderMode.Normal ) );
        }

        private static string SanitizeCSSFieldId( string cssFieldId )
        {
            if ( string.IsNullOrEmpty( cssFieldId ) )
            {
                cssFieldId = "self";
            }
            return cssFieldId;
        }

        private static string SanitizeCSSClassName( string cssClassName )
        {
            if ( string.IsNullOrEmpty( cssClassName ) )
            {
                cssClassName = "field-required";
            }
            return cssClassName;
        }
    }
}