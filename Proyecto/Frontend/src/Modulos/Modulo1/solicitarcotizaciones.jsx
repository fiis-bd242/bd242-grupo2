import { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog'
import { Badge } from '@/components/ui/badge'

export default function SolicitarCotizaciones() {
  const [pedidos, setPedidos] = useState([])
  const [selectedPedido, setSelectedPedido] = useState(null)

  useEffect(() => {
    fetchPedidosAceptados()
  }, [])

  const fetchPedidosAceptados = async () => {
    const response = await fetch('/api/pedidos/aceptados')
    if (response.ok) {
      const data = await response.json()
      setPedidos(data)
    } else {
      console.error('Failed to fetch pedidos aceptados')
    }
  }

  const handleSolicitarCotizacion = async (pedidoId) => {
    // Aquí iría la lógica para solicitar cotización a todos los proveedores
    console.log(`Solicitando cotización para el pedido ${pedidoId}`)
    // Después de solicitar la cotización, podrías actualizar el estado del pedido o de la cotización
  }

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-6">Solicitar Cotizaciones</h1>
      {pedidos.length === 0 ? (
        <p>No hay pedidos aceptados para solicitar cotizaciones.</p>
      ) : (
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>ID</TableHead>
              <TableHead>Fecha de Creación</TableHead>
              <TableHead>Usuario</TableHead>
              <TableHead>Estado</TableHead>
              <TableHead>Acciones</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {pedidos.map((pedido) => (
              <TableRow key={pedido.id}>
                <TableCell>{pedido.id}</TableCell>
                <TableCell>{new Date(pedido.fecha_creacion).toLocaleDateString()}</TableCell>
                <TableCell>{pedido.usuario}</TableCell>
                <TableCell>
                  <Badge variant="outline">{pedido.estado}</Badge>
                </TableCell>
                <TableCell>
                  <Dialog>
                    <DialogTrigger asChild>
                      <Button variant="outline" onClick={() => setSelectedPedido(pedido)}>Ver Detalles</Button>
                    </DialogTrigger>
                    <DialogContent>
                      <DialogHeader>
                        <DialogTitle>Detalles del Pedido #{selectedPedido?.id}</DialogTitle>
                      </DialogHeader>
                      <div>
                        <p>Usuario: {selectedPedido?.usuario}</p>
                        <p>Fecha de Creación: {new Date(selectedPedido?.fecha_creacion || '').toLocaleDateString()}</p>
                        <p>Estado: {selectedPedido?.estado}</p>
                        <h3 className="font-semibold mt-4 mb-2">Productos:</h3>
                        <ul>
                          {selectedPedido?.productos.map((producto) => (
                            <li key={producto.id}>{producto.nombre} - Cantidad: {producto.cantidad}</li>
                          ))}
                        </ul>
                      </div>
                      <div className="flex justify-end gap-2 mt-4">
                        <Button onClick={() => handleSolicitarCotizacion(selectedPedido?.id || 0)}>
                          Solicitar Cotización
                        </Button>
                      </div>
                    </DialogContent>
                  </Dialog>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      )}
    </div>
  )
}
