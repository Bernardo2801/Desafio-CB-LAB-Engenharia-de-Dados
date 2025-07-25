# KANBAN – Desafio CB LAB – Engenharia de Dados

Organização das tarefas dos dois desafios propostos no processo seletivo.

---

## Desafio 1 – Modelagem de Pedido (ERP)

### Backlog
- [ ] Analisar estrutura do JSON do pedido
- [ ] Definir relacionamentos entre entidades
- [ ] Justificar decisão de chave primária e estrangeira
- [ ] Planejar documentação (README + SQL)

### Em andamento
- [ ] Modelagem relacional inicial
- [ ] Testes de normalização

### Concluído
- [x] Interpretação dos dados do pedido
- [x] Identificação das entidades: cliente, item, pagamento etc.
- [x] Criação de tabelas SQL normalizadas
- [x] Geração de código SQL com `CREATE TABLE`
- [x] Documentação detalhada (README)

---

## Desafio 2 – Armazenamento no Data Lake

### Backlog
- [ ] Validar se estrutura atende ferramentas como Spark ou Presto
- [ ] Adicionar recomendações de versionamento automático de schema

### Em andamento
- [ ] Escrita do README explicando organização de diretórios

### Concluído
- [x] Justificativa para persistência das APIs
- [x] Criação de estrutura de partições (`/year/month/day/storeId/`)
- [x] Discussão sobre schema evolution e quebra de contrato
- [x] Discussão sobre implicações de mudanças em campos (`taxes → taxation`)
- [x] Tabela de decisões, riscos e mitigação
- [x] Documentação pronta no README.md