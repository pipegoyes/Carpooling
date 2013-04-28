using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities.Negocio
{
    [Flags]
    public enum ViajeEstado : int
    {
        Publicado = 1,
        Cancelado = 2,
        Realizado = 3
    }
}
