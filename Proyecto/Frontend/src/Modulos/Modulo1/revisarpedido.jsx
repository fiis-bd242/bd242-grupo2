import { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog'
import { Badge } from '@/components/ui/badge'

export default function RevisarPedidos() {
  const [pedidos, setPedidos] = useState([])
  const [selectedPedido, setSelectedPedido] = useState(null)

  useEffect(() => {
    fetchPedidos()
  }, [])

  const fetchPedidos = async () => {
    const response = await fetch('/api/pedidos')
    if (response.ok) {
      const data = await response.json()
      setPedidos(data)
    } else {
      console.error('Failed to fetch pedidos')
    }
  }

  const handleUpdateEstado = async (pedidoId, nuevoEstado) => {
    const response = await fetch(`/api/pedidos/${pedidoId}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nuevo_estado: nuevoEstado }),
    })

    if (response.ok) {
      fetchPedidos()
    } else {
      console.error('Failed to update pedido estado')
    }
  }

  const getEstadoBadge = (estado) => {
    switch (estado) {
      case 'pendiente':
        return <Badge variant="outline">Pendiente</Badge>
      case 'aceptado':
        return <Badge variant="success">Aceptado</Badge>
      case 'rechazado':
        return <Badge variant="destructive">Rechazado</Badge>
      default:
        return null
    }
  }

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-6">Revisar Pedidos</h1>
      {pedidos.length === 0 ? (
        <p>No hay pedidos para revisar.</p>
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
                <TableCell>{getEstadoBadge(pedido.estado)}</TableCell>
                <TableCell>
                  <Dialog>
                    <DialogTrigger asChild>
                      <Button variant="outline" onClick={() => setSelectedPedido(pedido)}>
                        Ver Detalles
                      </Button>
                    </DialogTrigger>
                    <DialogContent>
                      <DialogHeader>
                        <DialogTitle>Detalles del Pedido #{selectedPedido?.id}</DialogTitle>
                      </DialogHeader>
                      <div>
                        <p>Usuario: {selectedPedido?.usuario}</p>
                        <p>
                          Fecha de Creación:{' '}
                          {new Date(selectedPedido?.fecha_creacion || '').toLocaleDateString()}
                        </p>
                        <p>Estado: {getEstadoBadge(selectedPedido?.estado || '')}</p>
                        <h3 className="font-semibold mt-4 mb-2">Productos:</h3>
                        <ul>
                          {selectedPedido?.productos.map((producto) => (
                            <li key={producto.id}>
                              {producto.nombre} - Cantidad: {producto.cantidad}
                            </li>
                          ))}
                        </ul>
                      </div>
                      <div className="flex justify-end gap-2 mt-4">
                        <Button
                          onClick={() => handleUpdateEstado(selectedPedido?.id || 0, 'aceptado')}
                          disabled={selectedPedido?.estado !== 'pendiente'}
                        >
                          Aceptar
                        </Button>
                        <Button
                          variant="destructive"
                          onClick={() => handleUpdateEstado(selectedPedido?.id || 0, 'rechazado')}
                          disabled={selectedPedido?.estado !== 'pendiente'}
                        >
                          Rechazar
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
