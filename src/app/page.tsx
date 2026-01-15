import { createClient } from '@/lib/supabase/server';
import { cookies } from 'next/headers';
import { Table, TableBody, TableCell, TableHead, TableHeadCell, TableRow } from "flowbite-react";
import type { Tables } from '@/lib/supabase/database.types';

type Brand = Tables<'brands'>;

function formatDate(dateString: string | null): string {
  if (!dateString) return 'N/A';
  return new Date(dateString).toDateString();
}

export default async function Page() {
  const cookieStore = cookies();
  const supabase = createClient(cookieStore);

  const { data: brands, error } = await supabase
    .from('brands')
    .select('*');

  if (error) {
    throw error;
  }

  if (!brands || brands.length === 0) {
    return <div>No brands found</div>;
  }

  return (
    <div className="overflow-x-auto">
      <Table>
        <TableHead>
          <TableRow>
            <TableHeadCell>Name</TableHeadCell>
            <TableHeadCell>Brand ID</TableHeadCell>
            <TableHeadCell>Created At</TableHeadCell>
            <TableHeadCell>
              <span className="sr-only">Edit</span>
            </TableHeadCell>
          </TableRow>
        </TableHead>
        <TableBody className="divide-y">
          {brands.map((brand: Brand) => (
            <TableRow className="bg-white dark:border-gray-700 dark:bg-gray-800" key={brand.id}>
              <TableCell className="whitespace-nowrap font-medium text-gray-900 dark:text-white">
                {brand.name}
              </TableCell>
              <TableCell>{brand.id}</TableCell>
              <TableCell>{formatDate(brand.created_at)}</TableCell>
              <TableCell>
                <a href="#" className="font-medium text-primary-600 hover:underline dark:text-primary-500">
                  Edit
                </a>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}