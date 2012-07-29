namespace SavingsAnalysis.Web
{
    using System;
    using System.ComponentModel.Composition.Hosting;
    using System.IO;
    using System.Linq;
    using System.Reflection;
    using System.Web.Hosting;

    public class CompositionContainerFactory
    {        
        public static readonly log4net.ILog Log = log4net.LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        public CompositionContainer CreateContainer()
        {
            var binPath = HostingEnvironment.MapPath("~/bin");

            if (binPath == null)
            {
                throw new Exception("Unable to find the path");
            }

           var files = Directory.EnumerateFiles(binPath, "*.dll", SearchOption.AllDirectories).ToList();
               
            var catalog = new AggregateCatalog();

            foreach (var file in files)
            {
                try
                {
                    var asmCat = new AssemblyCatalog(file);

                    // We should only be interested in assemblies that contain at least one export
                    // otherwise we just log the exception and continue
                    if (asmCat.Parts.Any())
                    {
                        catalog.Catalogs.Add(asmCat);
                    }
                }
                catch (ReflectionTypeLoadException e)
                {
                    Log.Error(e);
                }
            }

            return new CompositionContainer(catalog);
        }
    }
}