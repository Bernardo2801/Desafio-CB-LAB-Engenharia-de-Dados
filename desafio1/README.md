🇧🇷
# Esboço desafio – Engenheiro de Dados  do Coco Bambu LAB

## Qual o meu objetivo?

Converter dados de um sistema ERP (cedido pela CBLAB em JSON) utilizado por uma loja de restaurante em um modelo relacional (SQL que foi a solicitação), representando corretamente a estrutura e relacionamentos entre os dados.

---

## Organização: Análise de ínicio:

### Dados fornecidos:
- Arquivo `ERP.json` com a resposta de um endpoint de API.
- Contém informações de **pedidos = (`guestChecks`)** com:
  - Detalhes financeiros e operacionais;
  - **Itens do pedido (`detailLines`)**;
  - **Itens do menu (`menuItem`)** embutidos em `detailLines`;
  - Impostos (`taxes`);
  - Campos futuros possíveis: `discount`, `serviceCharge`, `tenderMedia`, `errorCode`.

---

## Identificação das entidades (tables)

| Entidade       | Origem JSON                     | Observação                        |
|----------------|----------------------------------|-----------------------------------|
| `GuestCheck`   | Objeto dentro de `guestChecks`   | Pedido principal                  |
| `Tax`          | Array `taxes` dentro de `GuestCheck` | Vários impostos por pedido   |
| `DetailLine`   | Array `detailLines`              | Itens do pedido                   |
| `MenuItem`     | Objeto `menuItem` dentro de cada `detailLine` | Só existe quando for item de menu |

---

## Relações das tabelas

- Um `GuestCheck` possui **muitos** `DetailLines` e **muitos** `Taxes`.
- Cada `DetailLine` possui **um** `MenuItem` (se houver).
- Cada `MenuItem` pertence a **um** `DetailLine`.

---

## Premissas

1. Cada `detailLine` poderá ter um tipo distinto no futuro (ex: menuItem, desconto, serviço).
2. Mesmo com apenas 1 `menuItem` no exemplo, o modelo já suporta múltiplos itens.
3. Datas/timestamps em UTC e local devem ser armazenados.

## Como executar

1. Clone o repositório
2. Importe o arquivo `database.sql` no seu MySQL.
2. Explore o modelo com consultas!

## Tecnologias utilizadas
- MySQL 8+
- JSON schema
- SQL relacional

🇺🇸
# Draft – Data Engineer Challenge from Coco Bambu LAB

## What is my goal?

To convert data from an ERP system (provided by CBLAB in JSON format), used by a restaurant store, into a relational model (SQL as requested), correctly representing the structure and relationships between the data.

---

## Organization: Initial Analysis

### Provided data:
- `ERP.json` file containing the response from an API endpoint.
- Contains information about **orders = (`guestChecks`)** with:
  - Financial and operational details;
  - **Order items (`detailLines`)**;
  - **Menu items (`menuItem`)** embedded in `detailLines`;
  - Taxes (`taxes`);
  - Possible future fields: `discount`, `serviceCharge`, `tenderMedia`, `errorCode`.

---

## Entity Identification (tables)

| Entity         | JSON Source                          | Notes                                 |
|----------------|--------------------------------------|----------------------------------------|
| `GuestCheck`   | Object inside `guestChecks`          | Main order                             |
| `Tax`          | `taxes` array inside `GuestCheck`    | Multiple taxes per order               |
| `DetailLine`   | `detailLines` array                  | Items in the order                     |
| `MenuItem`     | `menuItem` object inside each `detailLine` | Only exists when it's a menu item |

---

## Table Relationships

- One `GuestCheck` has **many** `DetailLines` and **many** `Taxes`.
- Each `DetailLine` has **one** `MenuItem` (if present).
- Each `MenuItem` belongs to **one** `DetailLine`.

---

## Assumptions

1. Each `detailLine` may represent a different type in the future (e.g., menuItem, discount, service).
2. Even though the example only has one `menuItem`, the model supports multiple items.
3. Dates/timestamps in both UTC and local time should be stored.

## How to run

1. Clone the repository.
2. Import the `database.sql` file into your MySQL.
3. Explore the model with queries!

## Technologies used
- MySQL 8+
- JSON schema
- Relational SQL
