using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Server;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using EthereumSqlUtils.Signer;
using EthereumSqlUtils.Signer.Crypto;

namespace EthereumSqlUtils
{
    public class EthSigner
    {


        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void GetPublicAddress(string privateKey)
        {
            var publicAddress = EthECKey.GetPublicAddress(privateKey);

            SqlContext.Pipe?.Send(publicAddress);
        }
    }
}
