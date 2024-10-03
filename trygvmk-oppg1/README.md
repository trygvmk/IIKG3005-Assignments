## Moduler:

### key_vault:

Denne modulen har som formål å sikre lagring av sensitive data som VM credentials og lagringskonto nøkler. I tillegg styrer den tilgang til dette.

### network:

Denne modulen har som oppgave å opprette og konfigurere et virtuelt nettverk og det tilhørende subnettet. I tillegg styrer denne modulen sikkerhetsgruppeb som legges på nettverket.

### storage_accounts:

Denne modulen oppretter og administrere storage accounts og containers

### vms:

Modulen oppretter og konfigurere VMen i henhold til de spesifiserte parameterene. I tillegg sørger modulen for å gi VMen et nettverkskort og spesifiserer dette slik at VMen kan bruke nettet.

## Instruksjoner

1. **Initialiser Terraform**:

   Gå til ./environments/dev og skriv følgende kommando i console:

   `terraform init`

2. **Lag en tfplan fil**:

   `terraform plan -out="main.tfplan"`

3. **Start opp main.tfplan filen**:

   `terraform apply main.tfplan`

4. **Avslutt/Destroy oppsettet**:
   Når du er ferdig med oppsettet så kan du ta det ned igjen med følgende kommando:

   `terraform destroy`

   Du vil bli promptet med en konfirmasjonsmelding. Skriv da `yes`

## Pre-requisites or dependencies

Terraform
Azure CLI
Azure subscription
