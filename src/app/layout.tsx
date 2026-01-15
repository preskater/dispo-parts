import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { ThemeModeScript } from 'flowbite-react';
import "@/app/globals.css";
import CustomNavbar from "@/ui/marketing/CustomNavbar";
import CustomFooter from "@/ui/marketing/CustomFooter";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "DispoParts",
  description: "DispoParts is a web application dedicated to selling and buying used/new car parts from individuals.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <ThemeModeScript />
      </head>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <CustomNavbar />
        <main className="min-h-screen">
          {children}
        </main>
        <CustomFooter />
      </body>
    </html >
  );
}
