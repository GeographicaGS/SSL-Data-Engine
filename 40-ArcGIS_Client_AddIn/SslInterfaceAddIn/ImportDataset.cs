using System;
using System.Collections.Generic;
using System.Text;
using System.IO;


namespace SslInterfaceAddIn
{
    public class ImportDataset : ESRI.ArcGIS.Desktop.AddIns.Button
    {
        public ImportDataset()
        {
        }

        protected override void OnClick()
        {
        }

        protected override void OnUpdate()
        {
            Enabled = ArcCatalog.Application != null;
        }
    }
}
