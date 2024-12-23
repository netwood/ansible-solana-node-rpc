import asyncio
import httpx
import subprocess

from devtools import debug

async def main():
    # URL Raydium API для получения списков пулов
    url = 'https://api-v3.raydium.io/pools/info/list'

    payload = {
        'page': 1,
        'pageSize': 1000,
        'poolSortField': 'volume24h',
        'poolType': 'all',
        'sortType': 'desc',
    }

    filtered_mints = set()

    max_pages = 5

    # async with httpx.AsyncClient(timeout=30) as client:
    #     while True:

    #         if payload['page'] > max_pages:
    #             break

    #         print(f"Запрос страницы {payload['page']}...")

    #         response = await client.get(url, params=payload)
    #         response.raise_for_status()
    #         response_data = response.json()

    #         pools = response_data.get('data', {}).get('data', [])
    #         if not pools:
    #             break
            
    #         # Пробегаем по пулам и фильтруем по дневному объему >= 1_000_000
    #         for pool in pools:
    #             # Проверяем дневной объем в поле "day.volume"
    #             day_data = pool.get('day', {})
    #             volume = day_data.get('volume', 0)

    #             debug(f"Пул {pool.get('name', '???')}, дневной объем: {volume}")
    #             # if volume >= 1_000_000:
    #             if volume >= 500_000:
    #             # if volume >= 500_000 and volume <= 1_000_000:
    #                 # Извлекаем адреса минтов токенов
    #                 mintA = pool.get('mintA', {}).get('address')
    #                 mintB = pool.get('mintB', {}).get('address')
    #                 if mintA:
    #                     filtered_mints.add(mintA)
    #                 if mintB:
    #                     filtered_mints.add(mintB)

    #         # Проверяем есть ли следующая страница
    #         has_next = response_data.get('data', {}).get('hasNextPage', False)
    #         if not has_next:
    #             break

    #         payload['page'] += 1

    # if not filtered_mints:
    #     print("Нет токенов, удовлетворяющих условиям.")
    #     return

    # Формируем команду для запуска Jupiter Swap API
    command = [
        "./jupiter-swap-api",
        "--rpc-url", "http://127.0.0.1:8877",
        '--yellowstone-grpc-endpoint', 'http://127.0.0.1:10000',
        '--allow-circular-arbitrage',
    ]

    # Добавляем фильтр по минтам
    for mint in filtered_mints:
        command.extend(["--filter-markets-with-mints", mint])

    debug("Команда для запуска Jupiter Swap API:")
    debug(command)

    debug(len(filtered_mints), "токенов удовлетворяют условиям.")

    debug("Запускаем Jupiter Swap API...")

    # return

    # Запускаем Jupiter Swap API
    subprocess.run(command, check=True)


if __name__ == "__main__":
    asyncio.run(main())
