using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using SavingsAnalysis.Client.Common;

namespace SavingsAnalysis.Client
{
    public class DataExtractorFactory : IDataExtractorFactory
    {
        private readonly string sourceDirectory;

        private List<IDataExtractor> dataExtractors;

        public DataExtractorFactory(string directory)
        {
            sourceDirectory = directory;
        }

        public List<IDataExtractor> GetDataExtractors()
        {
            if (dataExtractors == null)
            {
                dataExtractors = new List<IDataExtractor>();

                var files = Directory.GetFiles(sourceDirectory, "SavingsAnalysis.Plugin.*.dll");
                foreach (var file in files)
                {
                    dataExtractors.Add(LoadPlugin(file));
                }
            }
            return dataExtractors;
        }

        public T GetExtractor<T>() where T : class, IDataExtractor
        {
            var extractors = GetDataExtractors();
            foreach (var e in extractors)
            {
                if (e is T)
                {
                    return e as T;
                }
            }
            return null;
        }

        private IDataExtractor LoadPlugin(string assemblyPath)
        {
            Type interfaceType = typeof(IDataExtractor);

            var extractorAssembly = Assembly.LoadFrom(assemblyPath);
            var types = extractorAssembly.GetTypes();
            foreach (var type in types)
            {
                //  Check if the type implements IDataExtractor
                if (interfaceType.IsAssignableFrom(type))
                {
                    //  Get the default constructor and create instance
                    return (IDataExtractor)extractorAssembly.CreateInstance(type.FullName);
                }
            }

            return null;
        }
    }
}