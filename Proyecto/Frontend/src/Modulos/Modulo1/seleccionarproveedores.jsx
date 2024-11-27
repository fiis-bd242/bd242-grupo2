import { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog'
import { Badge } from '@/components/ui/badge'

export default function SeleccionarProveedores() {
  const [cotizaciones, setCotizaciones] = useState([])
  const [proveedores, setProveedores] = useState({})
  const [selectedCotizacion, setSelectedCotizacion] = useState(null)

  useEffect(() => {
    fetchCotizaciones()
    fetchProveedores()
  }, [])

  const fetchCotizaciones = async () => {
    const response = await fetch('/api/cotizaciones')
    if (response.ok) {
      const data = await response.json()
      setCotizaciones(data)
    } else {
      console.error('Failed to fetch cotizaciones')
    }
  }

  const fetchProveedores = async () => {
    const response = await fetch('/api/proveedores')
    if (response.ok) {
      const data = await response.json()
      const proveedoresMap = data.reduce((acc, proveedor) => {
        acc[proveedor.id] = proveedor
        return acc
      }, {})
      setProveedores(proveedoresMap)
    } else {
      console.error('Failed to fetch proveedores')
    }
  }

  const handleUpdateProveedorEstado = async (proveedorId, nuevoEstado) => {
    const response = await fetch(`/api/proveedores/${proveedorId}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ estado: nuevoEstado }),
    })

    if (response.ok) {
      fetchProveedores()
    } else {
      console.error('Failed to update proveedor estado')
    }
  }

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-6">Seleccionar Proveedores</h1>
      {cotizaciones.length === 0 ? (
        <p>No hay cotizaciones para revisar.</p>
      ) : (
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>ID Cotización</TableHead>
              <TableHead>ID Pedido</TableHead>
              <TableHead>Proveedor</TableHead>
              <TableHead>Estado</TableHead>
              <TableHead>Monto Total</TableHead>
              <TableHead>Acciones</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {cotizaciones.map((cotizacion) => (
              <TableRow key={cotizacion.id}>
                <TableCell>{cotizacion.id}</TableCell>
                <TableCell>{cotizacion.pedido_id}</TableCell>
                <TableCell>{proveedores[cotizacion.proveedor_id]?.nombre}</TableCell>
                <TableCell>
                  <Badge variant="outline">{cotizacion.estado}</Badge>
                </TableCell>
                <TableCell>{cotizacion.monto_total ? `$${cotizacion.monto_total.toFixed(2)}` : 'N/A'}</TableCell>
                <TableCell>
                  <Dialog>
                    <DialogTrigger asChild>
                      <Button variant="outline" onClick={() => setSelectedCotizacion(cotizacion)}>
                        Ver Detalles
                      </Button>
                    </DialogTrigger>
                    <DialogContent>
                      <DialogHeader>
                        <DialogTitle>Detalles de la Cotización #{selectedCotizacion?.id}</DialogTitle>
                      </DialogHeader>
                      <div>
                        <p>Pedido ID: {selectedCotizacion?.pedido_id}</p>
                        <p>Proveedor: {proveedores[selectedCotizacion?.proveedor_id || 0]?.nombre}</p>
                        <p>Fecha de Solicitud: {new Date(selectedCotizacion?.fecha_solicitud || '').toLocaleDateString()}</p>
                        <p>Fecha de Respuesta: {selectedCotizacion?.fecha_respuesta ? new Date(selectedCotizacion.fecha_respuesta).toLocaleDateString() : 'N/A'}</p>
                        <p>Estado: {selectedCotizacion?.estado}</p>
                        <p>Monto Total: {selectedCotizacion?.monto_total ? `$${selectedCotizacion.monto_total.toFixed(2)}` : 'N/A'}</p>
                        <p>Comentarios: {selectedCotizacion?.comentarios || 'N/A'}</p>
                      </div>
                      <div className="flex justify-end gap-2 mt-4">
                        <Button onClick={() => handleUpdateProveedorEstado(selectedCotizacion?.proveedor_id || 0, 'aprobado')}>
                          Aprobar Proveedor
                        </Button>
                        <Button variant="destructive" onClick={() => handleUpdateProveedorEstado(selectedCotizacion?.proveedor_id || 0, 'desaprobado')}>
                          Desaprobar Proveedor
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
