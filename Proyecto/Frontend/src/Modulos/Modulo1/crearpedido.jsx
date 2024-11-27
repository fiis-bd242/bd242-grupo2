import { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table'
import { Checkbox } from '@/components/ui/checkbox'

export default function CrearPedido() {
  const [productos, setProductos] = useState([])
  const [selectedProducts, setSelectedProducts] = useState({})
  const [searchTerm, setSearchTerm] = useState('')

  useEffect(() => {
    fetchProductos()
  }, [])

  const fetchProductos = async () => {
    const response = await fetch('/api/productos')
    if (response.ok) {
      const data = await response.json()
      setProductos(data)
    } else {
      console.error('Failed to fetch productos')
    }
  }

  const handleProductSelect = (productId, isChecked) => {
    setSelectedProducts((prev) => {
      if (isChecked) {
        return { ...prev, [productId]: 1 }
      } else {
        const { [productId]: _, ...rest } = prev
        return rest
      }
    })
  }

  const handleQuantityChange = (productId, quantity) => {
    setSelectedProducts((prev) => ({ ...prev, [productId]: quantity }))
  }

  const handleCreatePedido = async () => {
    const pedidoData = {
      productos: Object.entries(selectedProducts).map(([productId, cantidad]) => ({
        producto_id: parseInt(productId),
        cantidad,
      })),
    }

    const response = await fetch('/api/pedidos', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(pedidoData),
    })

    if (response.ok) {
      alert('Pedido creado exitosamente')
      setSelectedProducts({})
    } else {
      alert('Error al crear el pedido')
    }
  }

  const filteredProductos = productos.filter((producto) =>
    producto.nombre.toLowerCase().includes(searchTerm.toLowerCase()) ||
    producto.codigo.toLowerCase().includes(searchTerm.toLowerCase())
  )

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-6">Crear Pedido</h1>
      <Input
        type="text"
        placeholder="Buscar productos..."
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
        className="mb-4"
      />
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead className="w-[50px]">Seleccionar</TableHead>
            <TableHead>Código</TableHead>
            <TableHead>Nombre</TableHead>
            <TableHead>Categoría</TableHead>
            <TableHead>Subcategoría</TableHead>
            <TableHead>Unidad de Medida</TableHead>
            <TableHead>Stock Actual</TableHead>
            <TableHead>Cantidad a Pedir</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {filteredProductos.map((producto) => (
            <TableRow key={producto.id}>
              <TableCell>
                <Checkbox
                  checked={producto.id in selectedProducts}
                  onCheckedChange={(checked) => handleProductSelect(producto.id, checked)}
                />
              </TableCell>
              <TableCell>{producto.codigo}</TableCell>
              <TableCell>{producto.nombre}</TableCell>
              <TableCell>{producto.categoria}</TableCell>
              <TableCell>{producto.subcategoria}</TableCell>
              <TableCell>{producto.unidad_medida}</TableCell>
              <TableCell>{producto.cantidad}</TableCell>
              <TableCell>
                <Input
                  type="number"
                  min="1"
                  value={selectedProducts[producto.id] || ''}
                  onChange={(e) => handleQuantityChange(producto.id, parseInt(e.target.value))}
                  disabled={!(producto.id in selectedProducts)}
                />
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      <Button onClick={handleCreatePedido} className="mt-4">
        Generar Solicitud de Compra
      </Button>
    </div>
  )
}
