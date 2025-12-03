# Secure PassVault (SPV)

**Cross-Platform System for Advanced Cryptographic Key Management and Semantic Identity Generation**

---

## 1. Project Overview and Architecture

Secure PassVault (SPV) is a robust, local-only password and identity management application developed in **C++** using the **Qt Widgets Framework**. The core design adheres to the **Model-View-Controller (MVC)** architectural pattern, ensuring a clean separation between the user interface (`MainWindow`) and the cryptographic business logic (`VaultBackend`).

The primary objective is to eliminate common security vulnerabilities by integrating advanced **System Programming** concepts directly into the data handling and persistence layers.

## 2. Security and Cryptographic Architecture

The integrity and confidentiality of the database (`vault.dat`) rely on a multi-layered cryptographic container approach.

### 2.1. Key Derivation and Anti-Brute Force Mechanism

The user's Master Key is transformed into a cryptographically strong encryption key using an iterative function designed to resist modern GPU-accelerated Brute Force attacks.

* **Mechanism:** PBKDF2-like process (Password-Based Key Derivation Function 2 structure).
* **Key Strength:** Uses a 256-bit derived key ($DK$).
* **Cost Parameter:** The process involves **10,000+ sequential SHA-256 iterations** applied to the Master Key concatenated with a unique, cryptographically random **Salt**. This computational delay ensures that attempted dictionary attacks are economically infeasible.

### 2.2. Data Integrity and Authentication

The `vault.dat` container integrates two levels of critical verification:

1.  **Integrity Control (HMAC):** Every save operation appends a **HMAC-SHA256** tag to the data. During loading, the system recalculates the HMAC using the derived key. Any mismatch indicates file corruption or external modification, leading to immediate access denial.
2.  **System-Bound 2FA:** A unique **System ID Hash** (derived from the host machine's hardware/OS identifiers) is stored in the file header. Access is blocked if the file is opened on an unauthorized machine, acting as a two-factor authentication layer tied to the system itself.

### 2.3. Data Persistence Reliability

To guarantee the stability and persistence of data across different operating environments (Dev vs. Release mode, different OSes), the application utilizes the **QStandardPaths** class.

* The system dynamically determines the absolute, writable location for application data (e.g., `~/Library/Application Support/SPV/` on macOS).
* This approach is essential to avoid failures associated with using unreliable relative paths, which are often blocked by OS security permissions in deployment environments.

## 3. Advanced Generation Models

SPV implements two distinct, specialized models for creating credentials:

### 3.1. Cryptographic Generation (Passwords)

* **Entropy Source:** Uses a **Cryptographically Secure Pseudorandom Number Generator (CSPRNG)** (`QRandomGenerator::system()`).
* **Strength Analysis:** The generated output is analyzed in real-time using the **Shannon Entropy Formula** ($E$) to provide an objective score (0–100) of password resistance:
    $$E = L \times \log_2(R)$$
    Where $L$ is the length and $R$ is the size of the available character pool.

### 3.2. Semantic Generation (Nicknames/Logins)

This module generates unique identifiers that are both memorable and complex:

* **Data Volume:** The model utilizes a proprietary base of **116 thematic dictionaries** (over 21,000 words) loaded via Qt Resource System (QRC).
* **Mushup Strategy:** Combines parts of two words from two randomly selected thematic categories (e.g., `word1[start]` + `word2[end]`) to create a unique semantic core.
* **Symbol Injection:** Random symbols and numbers are inserted and appended to the semantic core, adding an extra layer of randomness and ensuring high uniqueness across services.

## 4. Technical Stack and Deployment

| Component | Detail |
| :--- | :--- |
| **Language** | C++17 |
| **Framework** | Qt 6 (Qt Widgets) |
| **Encryption Primitives** | SHA-256, XOR (PBKDF2, HMAC) |
| **UI/UX** | Split View Layout, QStyleSheets Dark Theme |
| **Data Format** | Encrypted JSON |

### Deployment (macOS Example)

To create a standalone application bundle (`.app`), the project must be compiled in **Release mode** and processed by the Qt deployment tool:

```bash
# Example Deployment Command
/path/to/Qt/6.x.x/macos/bin/macdeployqt /path/to/build/keyvaulttfk.app