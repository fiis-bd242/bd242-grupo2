import { Button } from '@/components/ui/button'
import { Card, CardHeader, CardTitle, CardContent } from '@/components/ui/card'
import Link from 'next/link'

export default function Dashboard() {
  const options = [
    { name: 'Crear pedido', link: '/Modulo1/crearpedido' },
    { name: 'Revisar pedidos', link: '/dashboard/revisar-pedidos' },
    { name: 'Solicitar cotizaciones', link: '/dashboard/solicitar-cotizaciones' },
    { name: 'Seleccionar proveedores', link: '/dashboard/seleccionar-proveedores' },
    { name: 'Crear orden de compra', link: '/dashboard/crear-orden-compra' }
  ]

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-6">Dashboard de Compras</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {options.map((option) => (
          <Card key={option.name} className="cursor-pointer">
            <CardHeader>
              <CardTitle>{option.name}</CardTitle>
            </CardHeader>
            <CardContent>
              <Link href={option.link}>
                <Button>Seleccionar</Button>
              </Link>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}

