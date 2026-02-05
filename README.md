# RNA-Seq Quality Control Pipeline / RNA-Seq Kalite Kontrol Hattı

<p align="center">
  <a href="#-english-quality-control-report">🇺🇸 English</a> |
  <a href="#-türkçe-kalite-kontrol-raporu">🇹🇷 Türkçe</a>
</p>

---

<a name="-english-quality-control-report"></a>
## 🇺🇸 English: Quality Control Report (Findings)

### 1. Project Overview
This project performs a quality control (QC) analysis on a raw RNA-Seq dataset derived from *E. coli* (Bowtie2 example data). The goal is to assess sequencing quality, read length distribution, and potential issues before downstream analysis.

### 2. Data Source
- **Organism:** *Escherichia coli*
- **Source:** Bowtie2 Example Data (Raw FASTQ)
- **Data Type:** Single-end reads
- **Total Sequences:** 10,000 reads
- **Sequence Length:** Variable (40 – 354 bp)
- **GC Content:** 49%

### 3. Key Findings & Analysis
Based on FastQC reports and custom R visualizations (ShortRead/ggplot2), the following critical issues were identified:

* **Low Quality Scores (FAIL):** The *Per Base Sequence Quality* metrics indicate a significant drop in Phred scores (mean < 20) towards the 3' end of the reads. This suggests that the sequencing accuracy degrades as read length increases.
* **Variable Read Lengths:** Unlike standard Illumina runs, the dataset contains reads of varying lengths. The quality decay is most prominent in longer reads (>250 bp).
* **GC Content:** Spikes in GC content are attributed to the transcriptomic nature of the data (RNA-Seq expression bias) rather than contamination.

### 4. Conclusion & Action Plan
* **Adapter Status:** No adapter contamination was detected (PASS).
* **Action Required:** Although adapter trimming is not necessary, **Quality Trimming is mandatory.** A cutoff threshold (e.g., Phred 20) must be applied to remove low-quality bases at the 3' ends to prevent misalignment.

### 5. Visualization (R Output)
![Quality Plot](results/quality_plot_R.png)
*(R script output demonstrating the quality decay at the 3' end)*

---

<a name="-türkçe-kalite-kontrol-raporu"></a>
## 🇹🇷 Türkçe: Kalite Kontrol Raporu (Bulgular)

### 1. Proje Özeti
Bu proje, *E. coli* organizmasına ait ham RNA-Seq verileri üzerinde gerçekleştirilen bir kalite kontrol (QC) çalışmasıdır. Amaç, hizalama (alignment) aşaması öncesinde verinin dizileme kalitesini ve güvenilirliğini test etmektir.

### 2. Veri Kaynağı
- **Organizasyon:** *Escherichia coli*
- **Kaynak:** Bowtie2 Örnek Verisi (Ham FASTQ)
- **Toplam Sekans:** 10,000 okuma
- **Sekans Uzunluğu:** Değişken (40 – 354 bp)
- **%GC Oranı:** 49%

### 3. Temel Bulgular ve Analiz
FastQC raporu ve R (ggplot2) ile yapılan doğrulama analizleri sonucunda şu kritik noktalar tespit edilmiştir:

* **Düşük Kalite Skorları:** *Baz Başına Dizi Kalitesi* grafiği incelendiğinde, okumaların 3' ucuna doğru Phred kalite skorlarının ciddi oranda düştüğü (ortalama < 20) ve "riskli bölgeye" girdiği görülmüştür.
* **Değişken Okuma Uzunlukları:** Standart dizilemelerin aksine, bu veri setinde okuma uzunlukları değişkendir. Kalite düşüşü özellikle uzun okumaların (250 bp üzeri) son kısımlarında belirgindir.
* **GC İçeriği:** GC grafiğindeki dalgalanmaların, kontaminasyondan ziyade RNA-Seq verisinin doğasından (transkriptomik ifade farkları) kaynaklandığı değerlendirilmiştir.

### 4. Sonuç ve Aksiyon Planı
* **Adaptör Durumu:** Veride adaptör kirliliğine rastlanmamıştır (Temiz).
* **Karar:** Adaptör kırpma işlemine gerek duyulmasa da, **Kalite Kırpması (Quality Trimming) zorunludur.** Hizalama hatalarını önlemek için, Phred skoru 20'nin altında kalan kalitesiz uçların kesilip atılması gerekmektedir.
