'use client'

import { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/input'

export default function CrearOrdenCompra() {
  const [pedidos, setPedidos] = useState([])
  const [proveedores, setProveedores] = useState([])
  const [selectedPedido, setSelectedPedido] = useState(null)
  const [selectedProveedor, setSelectedProveedor] = useState(null)
  const [fechaRequerida, setFechaRequerida] = useState('')
  const [montoTotal, setMontoTotal] = useState('')

  useEffect(() => {
    fetchPedidosAceptados()
    fetchProveedores()
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

  const fetchProveedores = async () => {
    const response = await fetch('/api/proveedores')
    if (response.ok) {
      const data = await response.json()
      setProveedores(data)
    } else {
      console.error('Failed to fetch proveedores')
    }
  }

  const handleCrearOrdenCompra = async () => {
    if (!selectedPedido || !selectedProveedor || !fechaRequerida || !montoTotal) {
      alert('Por favor, complete todos los campos')
      return
    }

    const ordenCompra = {
      pedido_id: selectedPedido.id,
      proveedor_id: selectedProveedor,
      fecha_emision: new Date().toISOString().split('T')[0],
      fecha_requerida: fechaRequerida,
      monto_total: parseFloat(montoTotal),
      estado: 'emitida',
    }

    const response = await fetch('/api/ordenes-compra', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(ordenCompra),
    })

    if (response.ok) {
      const data = await response.json()
      alert(`Orden de compra creada con ID: ${data.id}`)
      setSelectedPedido(null)
      setSelectedProveedor(null)
      setFechaRequerida('')
      setMontoTotal('')
    } else {
      console.error('Failed to create orden de compra')
    }
  }

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-6">Crear Orden de Compra</h1>
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>ID Pedido</TableHead>
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
                    <Button
                      variant="outline"
                      onClick={() => setSelectedPedido(pedido)}
                    >
                      Seleccionar
                    </Button>
                  </DialogTrigger>
                  <DialogContent>
                    <DialogHeader>
                      <DialogTitle>
                        Crear Orden de Compra para Pedido #{pedido.id}
                      </DialogTitle>
                    </DialogHeader>
                    <div className="grid gap-4">
                      <div>
                        <label className="block mb-2">Proveedor</label>
                        <select
                          className="w-full p-2 border rounded"
                          value={selectedProveedor || ''}
                          onChange={(e) =>
                            setSelectedProveedor(Number(e.target.value))
                          }
                        >
                          <option value="">Seleccione un proveedor</option>
                          {proveedores.map((proveedor) => (
                            <option key={proveedor.id} value={proveedor.id}>
                              {proveedor.nombre}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div>
                        <label className="block mb-2">Fecha Requerida</label>
                        <Input
                          type="date"
                          value={fechaRequerida}
                          onChange={(e) => setFechaRequerida(e.target.value)}
                        />
                      </div>
                      <div>
                        <label className="block mb-2">Monto Total</label>
                        <Input
                          type="number"
                          value={montoTotal}
                          onChange={(e) => setMontoTotal(e.target.value)}
                          placeholder="Ingrese el monto total"
                        />
                      </div>
                      <Button onClick={handleCrearOrdenCompra}>
                        Crear Orden de Compra
                      </Button>
                    </div>
                  </DialogContent>
                </Dialog>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  )
}
