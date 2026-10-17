# oficina_api# API REST — Sistema de Gestão de Oficina Mecânica
## Seminário de Sistemas 2026

---

## 🗂️ Estrutura do Projeto

```
oficina/
├── core/
│   ├── settings.py
│   └── urls.py
└── api/
    ├── models.py       # CAMADA 1: Entidades do banco
    ├── serializers.py  # CAMADA 2: Validação e JSON
    ├── views.py        # CAMADA 3: CRUD e regras de negócio
    └── urls.py         # CAMADA 4: Rotas da API
```

---

## ▶️ Como executar

```bash
pip install django djangorestframework
python manage.py migrate
python manage.py runserver
```

---

## 📡 Endpoints

| Método | Rota                          | Descrição                        |
|--------|-------------------------------|----------------------------------|
| GET    | /api/clientes/                | Listar clientes                  |
| POST   | /api/clientes/                | Cadastrar cliente                |
| GET    | /api/clientes/{id}/           | Detalhar cliente                 |
| PUT    | /api/clientes/{id}/           | Editar cliente                   |
| DELETE | /api/clientes/{id}/           | Excluir cliente                  |
| GET    | /api/clientes/{id}/veiculos/  | Veículos do cliente              |
| GET    | /api/veiculos/                | Listar veículos                  |
| POST   | /api/veiculos/                | Cadastrar veículo                |
| GET    | /api/veiculos/{id}/           | Detalhar veículo                 |
| PUT    | /api/veiculos/{id}/           | Editar veículo                   |
| DELETE | /api/veiculos/{id}/           | Excluir veículo                  |
| GET    | /api/veiculos/{id}/ordens/    | Ordens do veículo                |
| GET    | /api/ordens/                  | Listar ordens de serviço         |
| POST   | /api/ordens/                  | Abrir ordem de serviço           |
| GET    | /api/ordens/{id}/             | Detalhar ordem                   |
| PATCH  | /api/ordens/{id}/             | Atualizar status da ordem        |
| DELETE | /api/ordens/{id}/             | Excluir ordem                    |

---

## 💡 Exemplos de uso

### Cadastrar cliente
```json
POST /api/clientes/
{
    "nome": "João Silva",
    "telefone": "(61) 99999-0000",
    "cpf": "123.456.789-00"
}
```

### Cadastrar veículo
```json
POST /api/veiculos/
{
    "marca": "Fiat",
    "modelo": "Uno",
    "ano": 2018,
    "placa": "ABC-1234",
    "cliente": 1
}
```

### Abrir ordem de serviço
```json
POST /api/ordens/
{
    "descricao": "Troca de óleo e filtro",
    "status": "aberta",
    "valor": 150.00,
    "veiculo": 1
}
```

### Atualizar status da ordem
```json
PATCH /api/ordens/1/
{
    "status": "concluida"
}
```

---

## 🧠 Regras de Negócio

1. CPF único por cliente
2. Placa única por veículo (convertida para maiúsculas automaticamente)
3. Ano do veículo entre 1900 e 2026
4. Valor da OS deve ser maior que zero
5. OS cancelada não pode ser reaberta
