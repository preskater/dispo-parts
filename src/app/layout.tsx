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
        className={`${geistSans.variable} ${geistMono.variable} flex min-h-screen flex-col bg-white text-gray-600 antialiased dark:bg-gray-900 dark:text-gray-400`}
      >
        <div className="sticky top-0 z-50">
          <CustomNavbar />
        </div>
        <main className="flex-1 w-full">
          <div className="container mx-auto px-4 py-8 sm:px-6 lg:px-8">
            {children}
          </div>
        </main>
        <div className="sticky bottom-0 z-40">
          <CustomFooter />
        </div>
      </body>
    </html>
  );
}
