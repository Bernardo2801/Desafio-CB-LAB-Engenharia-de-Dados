🇧🇷
# Desafio 2 – Armazenamento de dados no Data Lake da CB LAB

## Objetivo

Armazenar, organizar e estruturar as respostas de 5 endpoints de API referentes à rede de restaurantes, garantindo rastreabilidade, consistência histórica e escalabilidade para análises futuras.

---

## Questões solicitadas

### 1. Por que armazenar as respostas das APIs?

Armazenar as respostas das APIs garante:

- **Rastreabilidade e Auditoria:** Permite verificar inconsistências futuras e validar informações.
- **Fonte Confiável e Histórica:** APIs podem sofrer alterações, quedas ou atualizações. Ter os dados persistidos garante a integridade histórica.
- **Análises e Reprocessamento:** Possibilita novas análises ou geração de relatórios sem reconsultar as APIs.
- **Evita Perda de Dados:** Garante persistência mesmo com eventuais falhas na fonte original.

---

### 2. Como armazenar os dados?

Foi adotada uma **estrutura particionada** para facilitar buscas, filtros, validações e leitura eficiente por data e loja.

```
/data-lake/raw/cb_lab_api/
└── [endpoint-name]/
    └── year=2025/
        └── month=07/
            └── day=25/
                └── storeId=001/
                    └── response.json
```

#### Justificativa:

- Organização clara por endpoint e data
- Facilita uso por ferramentas de Big Data como Hive, Spark ou Presto
- Escalável para milhares de arquivos
- Permite compressão e políticas de retenção

---

### 3. Mudança no schema: `guestChecks.taxes` → `guestChecks.taxation`

#### Implicações:

- Quebra de pipelines existentes que esperam o campo antigo;
- Erros em transformações, parse de dados e dashboards;
- Necessidade de versionamento ou validação de schema.

---

## Processo de Pensamento

### Etapas

1. Entendimento da necessidade: ingestão bruta para reprocessamentos e auditoria
2. Criação de estrutura lógica por data e loja
3. Preocupações com volume, schema e confiabilidade
4. Organização de arquivos para fácil consulta por ferramentas de análise

---

## Preocupações

| Tipo                 | Descrição                                                        |
|----------------------|------------------------------------------------------------------|
| Mudanças silenciosas | Podem quebrar pipelines — prever múltiplos schemas               |
| Volume de dados      | Considerar compressão e ciclo de vida                            |
| Validação de schema  | Adiar para etapa posterior para evitar falhas imediatas          |

---

## Consequências das Decisões

| Decisão                         | Consequência Positiva                   | Possível Risco / Mitigação                        |
|-------------------------------  |-----------------------------------------|---------------------------------------------------|
| Armazenar JSONs brutos          | Preserva dados para reprocessamento     | Compressão e limpeza periódica                    |
| Estrutura particionada por data | Facilita buscas e filtros               | Manter consistência de nomenclatura               |
| Adiar validação de schema       | Evita falhas por mudanças de contrato   | Monitoramento com alertas sobre mudanças críticas |

🇺🇸
# Challenge 2 – Data Storage in CB LAB's Data Lake

## Objective

Store, organize, and structure the responses from 5 API endpoints related to a restaurant chain, ensuring traceability, historical consistency, and scalability for future analysis.

---

## Requested Questions

### 1. Why store API responses?

Storing API responses ensures:

- **Traceability and Auditing:** Enables future verification of inconsistencies and data validation.
- **Reliable and Historical Source:** APIs may change, go down, or be updated. Persisting data guarantees historical integrity.
- **Analysis and Reprocessing:** Allows for new analyses or report generation without re-querying the APIs.
- **Prevents Data Loss:** Ensures data persistence even if the original source fails.

---

### 2. How to store the data?

A **partitioned structure** was adopted to facilitate searches, filters, validations, and efficient reading by date and store.

```
/data-lake/raw/cb_lab_api/
└── [endpoint-name]/
    └── year=2025/
        └── month=07/
            └── day=25/
                └── storeId=001/
                    └── response.json
```

#### Justification:

- Clear organization by endpoint and date
- Facilitates usage by Big Data tools like Hive, Spark, or Presto
- Scalable to thousands of files
- Allows compression and retention policies

---

### 3. Schema change: `guestChecks.taxes` → `guestChecks.taxation`

#### Implications:

- Breaks existing pipelines that expect the old field
- Errors in data transformation, parsing, and dashboards
- Requires schema versioning or validation

---

## Thought Process

### Steps

1. Understanding the need: raw ingestion for reprocessing and auditing
2. Creating a logical structure by date and store
3. Addressing concerns regarding volume, schema, and reliability
4. Organizing files for easy querying by analysis tools

---

## Concerns

| Type                  | Description                                                       |
|-----------------------|-------------------------------------------------------------------|
| Silent schema changes | May break pipelines — prepare for multiple schema versions        |
| Data volume           | Consider compression and lifecycle management                     |
| Schema validation     | Postpone to a later stage to avoid immediate failures             |

---

## Consequences of Decisions

| Decision                         | Positive Outcome                        | Potential Risk / Mitigation                        |
|----------------------------------|------------------------------------------|----------------------------------------------------|
| Storing raw JSONs                | Preserves data for reprocessing          | Use compression and periodic cleanup               |
| Partitioned structure by date    | Facilitates searches and filtering       | Maintain consistent naming conventions             |
| Delaying schema validation       | Avoids failures due to contract changes  | Monitor with alerts for critical changes           |
